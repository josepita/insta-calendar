<?php

namespace App\Http\Controllers;

use App\Models\Cuenta;
use App\Models\Post;
use Illuminate\Http\Request;
use Carbon\Carbon;

class CalendarController extends Controller
{
    /**
     * Muestra la página principal del calendario.
     */
    public function index()
    {
        // Obtenemos todas las cuentas para el selector
        $cuentas = Cuenta::orderBy('nombre_cuenta')->get();
        return view('calendar.index', compact('cuentas'));
    }

    /**
     * Proporciona los datos de los posts vía AJAX.
     */
    public function getCalendarData(Request $request)
    {
        // Validamos los datos que llegan por AJAX
        $data = $request->validate([
            'cuenta_id' => 'required|exists:cuentas,id',
            'year' => 'required|integer',
            'month' => 'required|integer|between:1,12',
        ]);

        $cuentaId = $data['cuenta_id'];
        $year = $data['year'];
        $month = $data['month'];
        $date = Carbon::create($year, $month, 1);

        // Obtenemos los posts del mes solicitado para esa cuenta
        $posts = Post::where('cuenta_id', $cuentaId)
            ->whereYear('published_at', $year)
            ->whereMonth('published_at', $month)
            ->orderBy('published_at', 'asc')
            ->get()
            ->groupBy(function ($post) {
                // Agrupamos los posts por día para facilitar el renderizado
                return $post->published_at->day;
            });

        // Lógica de navegación inteligente
        $prevMonth = $date->copy()->subMonth();
        $nextMonth = $date->copy()->addMonth();

        $hasPrevPosts = Post::where('cuenta_id', $cuentaId)
            ->whereYear('published_at', $prevMonth->year)
            ->whereMonth('published_at', $prevMonth->month)
            ->exists();

        $hasNextPosts = Post::where('cuenta_id', $cuentaId)
            ->whereYear('published_at', $nextMonth->year)
            ->whereMonth('published_at', $nextMonth->month)
            ->exists();

        // Devolvemos todo en formato JSON
        return response()->json([
            'posts' => $posts,
            'navigation' => [
                'prev_enabled' => $hasPrevPosts,
                'next_enabled' => $hasNextPosts
            ]
        ]);
    }
}