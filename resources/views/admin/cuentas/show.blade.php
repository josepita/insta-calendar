<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Detalles de: {{ $cuenta->nombre_cuenta }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <!-- Card de Importación de Posts -->
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <h3 class="text-lg font-medium text-gray-900 mb-4">
                        Importar Publicaciones (JSON)
                    </h3>
                    
                    <p class="text-sm text-gray-600 mb-4">
                        Sube un fichero .json con los datos de las publicaciones. Los posts existentes en el rango de fechas del fichero serán eliminados y reemplazados para evitar duplicados.
                    </p>

                    <!-- Formulario de Subida -->
                    <form id="import-form" method="POST" action="{{ route('admin.cuentas.import', $cuenta) }}" enctype="multipart/form-data">
                        @csrf
                        
                        <!-- Mensajes de feedback para el usuario -->
                        @if (session('success'))
                            <div class="mb-4 p-4 bg-green-100 text-green-700 border border-green-200 rounded-md">
                                {!! nl2br(e(session('success'))) !!}
                            </div>
                        @endif
                        @if (session('error'))
                            <div class="mb-4 p-4 bg-red-100 text-red-700 border border-red-200 rounded-md">
                                {{ session('error') }}
                            </div>
                        @endif
                        @if ($errors->any())
                            <div class="mb-4 p-4 bg-red-100 text-red-700 border border-red-200 rounded-md">
                                <strong>¡Vaya! Hubo algunos problemas con tu entrada.</strong>
                                <ul class="mt-3 list-disc list-inside text-sm">
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div>
                            <label for="json_file" class="block font-medium text-sm text-gray-700">Fichero de datos (.json)</label>
                            <input id="json_file" name="json_file" type="file" required accept=".json" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 focus:outline-none mt-1">
                        </div>

                        <!-- Checkbox para Modo Debug -->
                        <div class="block mt-4">
                            <label for="debug_mode" class="inline-flex items-center">
                                <input id="debug_mode" type="checkbox" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:ring-indigo-500" name="debug_mode">
                                <span class="ms-2 text-sm text-gray-600">{{ __('Activar Modo Debug (feedback en tiempo real)') }}</span>
                            </label>
                        </div>

                        <div class="flex items-center justify-end mt-4">
                            <x-primary-button type="submit" id="import-button">
                                {{ __('Importar Fichero') }}
                            </x-primary-button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Área para mostrar la salida del debug (AHORA FUERA DE LA CARD BLANCA) -->
            <div id="debug-container" class="hidden mt-6">
                <h4 class="text-md font-semibold text-gray-700">Salida del Proceso:</h4>
                <!-- CAMBIO: Se usan estilos inline para asegurar el fondo negro y texto blanco -->
                <pre id="debug-output" class="text-sm rounded-md p-4 mt-2 overflow-x-auto whitespace-pre-wrap font-mono" style="background-color: #111827; color: #ffffff; max-height: 400px; overflow-y: auto;"></pre>
            </div>
            <!-- Card de Posts Importados -->
            <div class="mt-8 bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <h3 class="text-lg font-medium text-gray-900 mb-4">
                        Publicaciones Importadas ({{ $posts->total() }})
                    </h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Imagen</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Caption</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tipo</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Estadísticas</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha Publicación</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                @forelse ($posts as $post)
                                    <tr>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            @if($post->display_url)
                                                <img src="{{ $post->display_url }}" alt="Post image" class="h-12 w-12 rounded-md object-cover">
                                            @else
                                                <div class="h-12 w-12 rounded-md bg-gray-200 flex items-center justify-center text-xs text-gray-500">Sin img</div>
                                            @endif
                                        </td>
                                        <td class="px-6 py-4"><div class="text-sm text-gray-900 w-64 truncate" title="{{ $post->caption }}">{{ $post->caption }}</div></td>
                                        <td class="px-6 py-4 whitespace-nowrap"><span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full @if($post->type == 'Video') bg-blue-100 text-blue-800 @endif @if($post->type == 'Image') bg-green-100 text-green-800 @endif @if($post->type == 'Sidecar') bg-yellow-100 text-yellow-800 @endif">{{ $post->type }}</span></td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">👍 {{ $post->likes_count }} 💬 {{ $post->comments_count }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $post->published_at->format('d/m/Y H:i') }}</td>
                                    </tr>
                                @empty
                                    <tr><td colspan="5" class="px-6 py-4 whitespace-nowrap text-center text-gray-500">No hay publicaciones importadas para esta cuenta.</td></tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-4">{{ $posts->links() }}</div>
                </div>
            </div>

            <div class="mt-6 text-right">
                <a href="{{ route('admin.cuentas.index') }}" class="text-sm text-gray-600 hover:text-gray-900">
                    &larr; Volver a la lista de cuentas
                </a>
            </div>
        </div>
    </div>

    <!-- SCRIPT para manejar el modo debug -->
    <script>
        document.getElementById('import-form').addEventListener('submit', function(event) {
            const debugModeCheckbox = document.getElementById('debug_mode');
            if (!debugModeCheckbox.checked) {
                return;
            }
            event.preventDefault();
            const form = event.target;
            const formData = new FormData(form);
            const debugContainer = document.getElementById('debug-container');
            const debugOutput = document.getElementById('debug-output');
            const importButton = document.getElementById('import-button');

            debugContainer.classList.remove('hidden');
            debugOutput.textContent = 'Iniciando proceso de importación...\n\n';
            importButton.disabled = true;
            importButton.textContent = 'Procesando...';

            fetch(form.action, {
                method: 'POST',
                body: formData,
                headers: { 'X-CSRF-TOKEN': document.querySelector('input[name="_token"]').value }
            }).then(async response => {
                const reader = response.body.getReader();
                const decoder = new TextDecoder();
                while (true) {
                    const { done, value } = await reader.read();
                    if (done) break;
                    const chunk = decoder.decode(value, { stream: true });
                    debugOutput.textContent += chunk;
                    debugOutput.scrollTop = debugOutput.scrollHeight;
                }
            }).catch(error => {
                debugOutput.textContent += `\n\n--- ERROR DE CONEXIÓN ---\n${error.message}`;
            }).finally(() => {
                importButton.disabled = false;
                importButton.textContent = 'Importar Fichero';
                debugOutput.innerHTML += `\n\n--- PROCESO FINALIZADO ---\n<a href='${window.location.href}' class='text-blue-400 underline'>Recargar la página para ver los resultados en la tabla.</a>`;
                debugOutput.scrollTop = debugOutput.scrollHeight;
            });
        });
    </script>
</x-app-layout>