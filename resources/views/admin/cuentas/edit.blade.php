<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Editar Cuenta') }}: {{ $cuenta->nombre_cuenta }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    
                    <!-- Formulario de edición -->
                    <form method="POST" action="{{ route('admin.cuentas.update', $cuenta) }}">
                        @csrf
                        @method('PUT') <!-- Importante para indicar que es una actualización -->

                        <!-- Nombre de la Cuenta -->
                        <div>
                            <x-input-label for="nombre_cuenta" :value="__('Nombre de la Cuenta')" />
                            <x-text-input id="nombre_cuenta" class="block mt-1 w-full" type="text" name="nombre_cuenta" :value="old('nombre_cuenta', $cuenta->nombre_cuenta)" required autofocus />
                            <x-input-error :messages="$errors->get('nombre_cuenta')" class="mt-2" />
                        </div>

                        <!-- Handle de Instagram -->
                        <div class="mt-4">
                            <x-input-label for="handle_instagram" :value="__('Handle de Instagram (ej: @aldajoyeros)')" />
                            <x-text-input id="handle_instagram" class="block mt-1 w-full" type="text" name="handle_instagram" :value="old('handle_instagram', $cuenta->handle_instagram)" required />
                            <x-input-error :messages="$errors->get('handle_instagram')" class="mt-2" />
                        </div>

                        <!-- Logo URL (Opcional) -->
                        <div class="mt-4">
                            <x-input-label for="logo_url" :value="__('URL del Logo (Opcional)')" />
                            <x-text-input id="logo_url" class="block mt-1 w-full" type="text" name="logo_url" :value="old('logo_url', $cuenta->logo_url)" />
                            <x-input-error :messages="$errors->get('logo_url')" class="mt-2" />
                        </div>

                        <div class="flex items-center justify-between mt-4">
                            <a href="{{ route('admin.cuentas.index') }}">
                                <x-secondary-button type="button">
                                    {{ __('Cancelar') }}
                                </x-secondary-button>
                            </a>
                            <x-primary-button>
                                {{ __('Actualizar Cuenta') }}
                            </x-primary-button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
