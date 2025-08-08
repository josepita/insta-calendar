<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Cuenta;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Symfony\Component\HttpFoundation\StreamedResponse;

class CuentaController extends Controller
{
    // ... index, create, store, show, edit, update, destroy (sin cambios) ...
    public function index(){$cuentas=Cuenta::withCount(['posts as video_count'=>function($query){$query->where('type','Video');},'posts as image_count'=>function($query){$query->where('type','Image');},'posts as sidecar_count'=>function($query){$query->where('type','Sidecar');}])->withMin('posts','published_at')->withMax('posts','published_at')->get();return view('admin.cuentas.index',compact('cuentas'));}
    public function create(){return view('admin.cuentas.create');}
    public function store(Request $request){$validated=$request->validate(['nombre_cuenta'=>'required|string|max:255','handle_instagram'=>'required|string|max:255','logo_url'=>'nullable|url|max:1024',]);Cuenta::create($validated);return redirect()->route('admin.cuentas.index')->with('success','Cuenta creada correctamente.');}
    public function show(Cuenta $cuenta){$posts=$cuenta->posts()->orderBy('published_at','desc')->paginate(10);return view('admin.cuentas.show',compact('cuenta','posts'));}
    public function edit(Cuenta $cuenta){return view('admin.cuentas.edit',compact('cuenta'));}
    public function update(Request $request,Cuenta $cuenta){$validated=$request->validate(['nombre_cuenta'=>'required|string|max:255','handle_instagram'=>'required|string|max:255','logo_url'=>'nullable|url|max:1024',]);$cuenta->update($validated);return redirect()->route('admin.cuentas.index')->with('success','Cuenta actualizada correctamente.');}
    public function destroy(Cuenta $cuenta){$cuenta->delete();return redirect()->route('admin.cuentas.index')->with('success','Cuenta eliminada correctamente.');}


    public function import(Request $request, Cuenta $cuenta)
    {
        $request->validate([
            'json_file' => 'required|file|mimetypes:application/json,text/plain',
        ]);

        $file = $request->file('json_file');
        $postsData = json_decode($file->get(), true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            return back()->with('error', 'Error: El fichero JSON no tiene un formato válido.');
        }

        // Unificamos la lógica: siempre devolveremos una respuesta en streaming.
        // La diferencia será el nivel de detalle de los mensajes.
        $isDebug = $request->has('debug_mode');
        return $this->importWithStreaming($postsData, $cuenta, $isDebug);
    }

    private function importWithStreaming(array $postsData, Cuenta $cuenta, bool $isDebug)
    {
        $response = new StreamedResponse(function() use ($postsData, $cuenta, $isDebug) {
            $sendMessage = function($message) { echo $message . "\n"; ob_flush(); flush(); usleep(50000); };
            
            $totalPosts = count($postsData);
            $processedCount = 0;
            $skippedCount = 0;
            $failedImages = [];

            $sendMessage("Iniciando... Se encontraron {$totalPosts} posts en el fichero.");

            try {
                // Filtramos posts con datos esenciales ANTES de la transacción
                $validPostsData = [];
                foreach ($postsData as $post) {
                    if (empty($post['id']) || empty($post['type']) || empty($post['url']) || empty($post['timestamp'])) {
                        $skippedCount++;
                        $id = $post['id'] ?? 'desconocido';
                        if ($isDebug) {
                            $sendMessage("SALTANDO post con ID '{$id}' por falta de datos esenciales.");
                        }
                    } else {
                        $validPostsData[] = $post;
                    }
                }

                if (empty($validPostsData)) {
                    $sendMessage("\nNo hay posts válidos para importar.");
                    return;
                }

                DB::transaction(function () use ($validPostsData, $cuenta, &$processedCount, &$failedImages, $sendMessage, $isDebug) {
                    $timestamps = array_column($validPostsData, 'timestamp');
                    $minDate = Carbon::parse(min($timestamps))->startOfDay();
                    $maxDate = Carbon::parse(max($timestamps))->endOfDay();
                    
                    if ($isDebug) $sendMessage("Borrando posts antiguos entre {$minDate->format('d/m/Y')} y {$maxDate->format('d/m/Y')}...");
                    $deletedCount = Post::where('cuenta_id', $cuenta->id)->whereBetween('published_at', [$minDate, $maxDate])->delete();
                    if ($isDebug) $sendMessage("Se eliminaron {$deletedCount} posts antiguos.\n");

                    foreach ($validPostsData as $postData) {
                        if ($isDebug) {
                            $sendMessage("--- Post " . ($processedCount + 1) . "/" . count($validPostsData) . " (ID: {$postData['id']}) ---");
                        }
                        
                        $this->processPost($postData, $cuenta, $failedImages, $isDebug ? $sendMessage : null);
                        $processedCount++;
                        
                        if (!$isDebug) {
                            $sendMessage("Procesado {$processedCount} de " . count($validPostsData) . " posts válidos...");
                        } else {
                             $sendMessage("-> Post importado.\n");
                        }
                    }
                });
            } catch (\Exception $e) {
                Log::error('Error al importar JSON: ' . $e->getMessage() . ' en la línea ' . $e->getLine());
                $sendMessage("\nERROR: Ha ocurrido un error inesperado durante el proceso: " . $e->getMessage());
                return;
            }

            $sendMessage("\n--- RESUMEN ---");
            $sendMessage("Posts procesados e importados: {$processedCount}");
            if ($skippedCount > 0) {
                $sendMessage("Posts saltados por datos incompletos: {$skippedCount}");
            }
            if (!empty($failedImages)) {
                $sendMessage("Imágenes con error de descarga: " . count($failedImages));
            } else {
                $sendMessage("Todas las imágenes se descargaron correctamente.");
            }
        });

        $response->headers->set('Content-Type', 'text/event-stream');
        $response->headers->set('Cache-Control', 'no-cache');
        $response->headers->set('X-Accel-Buffering', 'no');
        return $response;
    }
    
    private function processPost(array $postData, Cuenta $cuenta, array &$failedImages, callable $sendMessage = null)
    {
        $localDisplayUrl = null;
        if (!empty($postData['displayUrl'])) {
            if ($sendMessage) $sendMessage("  - Descargando imagen principal...");
            $localDisplayUrl = $this->downloadImage($postData['displayUrl'], $cuenta->id);
            if (!$localDisplayUrl) {
                if ($sendMessage) $sendMessage("  - FALLO al descargar imagen principal.");
                $failedImages[] = $postData['displayUrl'];
            } else {
                if ($sendMessage) $sendMessage("  - Imagen guardada en: " . basename($localDisplayUrl));
            }
        }

        $localImages = [];
        if ($postData['type'] === 'Sidecar' && !empty($postData['images'])) {
            if ($sendMessage) $sendMessage("  - Procesando carrusel...");
            foreach ($postData['images'] as $imgIndex => $imageUrl) {
                $localImageUrl = $this->downloadImage($imageUrl, $cuenta->id);
                if ($localImageUrl) {
                    $localImages[] = $localImageUrl;
                } else {
                    if ($sendMessage) $sendMessage("    - FALLO al descargar imagen de carrusel " . ($imgIndex+1) . ".");
                    $failedImages[] = $imageUrl;
                }
            }
        }

        Post::create([
            'cuenta_id' => $cuenta->id,
            'instagram_id' => $postData['id'],
            'type' => $postData['type'],
            'caption' => $postData['caption'] ?? '',
            'url' => $postData['url'],
            'comments_count' => $postData['commentsCount'] ?? 0,
            'likes_count' => $postData['likesCount'] ?? 0,
            'video_play_count' => $postData['videoPlayCount'] ?? 0,
            'display_url' => $localDisplayUrl,
            'images' => !empty($localImages) ? json_encode($localImages) : null,
            'published_at' => Carbon::parse($postData['timestamp']),
        ]);
    }

    private function downloadImage(string $url, int $cuentaId): ?string
    {
        try {
            $headers = Http::timeout(4)->head($url);
            if (!$headers->successful()) {
                Log::warning("La URL de la imagen no es accesible (código {$headers->status()}): {$url}");
                return null;
            }
            $response = Http::timeout(8)->get($url);
            if ($response->successful()) {
                $filename = 'cuenta-'.$cuentaId.'-'.Str::random(10).'.jpg';
                $path = 'posts/'.$filename;
                Storage::disk('public')->put($path, $response->body());
                return Storage::url($path);
            }
        } catch (\Exception $e) {
            Log::error("No se pudo descargar la imagen: {$url} - Error: ".$e->getMessage());
        }
        return null;
    }
}
