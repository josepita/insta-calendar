<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Crear Nueva Cuenta') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    
                    <!-- Formulario de creación -->
                    <form method="POST" action="{{ route('admin.cuentas.store') }}">
                        @csrf

                        <!-- Nombre de la Cuenta -->
                        <div>
                            <label for="nombre_cuenta" class="block font-medium text-sm text-gray-700">Nombre de la Cuenta</label>
                            <input id="nombre_cuenta" class="block mt-1 w-full rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" type="text" name="nombre_cuenta" required autofocus />
                        </div>

                        <!-- Handle de Instagram -->
                        <div class="mt-4">
                            <label for="handle_instagram" class="block font-medium text-sm text-gray-700">Handle de Instagram (ej: @aldajoyeros)</label>
                            <input id="handle_instagram" class="block mt-1 w-full rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" type="text" name="handle_instagram" required />
                        </div>

                        <!-- Logo URL (Opcional) -->
                        <div class="mt-4">
                            <label for="logo_url" class="block font-medium text-sm text-gray-700">URL del Logo (Opcional)</label>
                            <input id="logo_url" class="block mt-1 w-full rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" type="text" name="logo_url" />
                        </div>

                        <div class="flex items-center justify-between  mt-4">
                            <a href="{{ route('admin.cuentas.index') }}">
                                <x-secondary-button type="button">
                                    {{ __('Cancelar') }}
                                </x-secondary-button>
                            </a>
                            <button type="submit" class="ml-4 inline-flex items-center px-4 py-2 bg-gray-800 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:ring ring-gray-300 disabled:opacity-25 transition ease-in-out duration-150">
                                Guardar Cuenta
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>