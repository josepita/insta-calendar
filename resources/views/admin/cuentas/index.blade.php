<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Gestión de Cuentas') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            
            @if(session('success'))
                <div class="mb-4 p-4 bg-green-100 text-green-700 rounded-lg">
                    {{ session('success') }}
                </div>
            @endif

            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">

                    <div class="flex justify-end mb-4">
                        <a href="{{ route('admin.cuentas.create') }}">
                            <x-primary-button>
                                {{ __('Crear Nueva Cuenta') }}
                            </x-primary-button>
                        </a>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nombre</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Posts (V/I/C)</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha Inicial</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fecha Final</th>
                                    <th class="relative px-6 py-3"><span class="sr-only">Acciones</span></th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                @forelse ($cuentas as $cuenta)
                                    <tr>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="font-semibold text-gray-900">
                                                {{ $cuenta->nombre_cuenta }}
                                            </div>
                                            <div class="text-sm text-gray-500">{{ $cuenta->handle_instagram }}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                                            <span title="Video" class="font-bold text-blue-600">{{ $cuenta->video_count }}</span> / 
                                            <span title="Imagen" class="font-bold text-green-600">{{ $cuenta->image_count }}</span> / 
                                            <span title="Carrusel" class="font-bold text-yellow-600">{{ $cuenta->sidecar_count }}</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                            {{ $cuenta->posts_min_published_at ? \Carbon\Carbon::parse($cuenta->posts_min_published_at)->format('d/m/Y') : '-' }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                            {{ $cuenta->posts_max_published_at ? \Carbon\Carbon::parse($cuenta->posts_max_published_at)->format('d/m/Y') : '-' }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                            <div class="flex items-center justify-end space-x-2">
                                                <a href="{{ route('admin.cuentas.show', $cuenta) }}">
                                                    <x-primary-button type="button">
                                                        Importar
                                                    </x-primary-button>
                                                </a>
                                                <a href="{{ route('admin.cuentas.edit', $cuenta) }}">
                                                    <x-secondary-button type="button">
                                                        Editar
                                                    </x-secondary-button>
                                                </a>
                                                <form action="{{ route('admin.cuentas.destroy', $cuenta) }}" method="POST" onsubmit="return confirm('¿Estás seguro de que quieres eliminar esta cuenta y todos sus posts?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <x-danger-button type="submit">
                                                        Eliminar
                                                    </x-danger-button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="5" class="px-6 py-4 whitespace-nowrap text-center text-gray-500">
                                            No hay cuentas creadas todavía.
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
