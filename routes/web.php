<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\CuentaController; // 1. Importamos el controlador
use App\Http\Controllers\ProfileController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// --- RUTA PÚBLICA PRINCIPAL ---
Route::get('/', [App\Http\Controllers\CalendarController::class, 'index'])->name('calendar.index');
// --- API PARA OBTENER DATOS DEL CALENDARIO ---
Route::get('/api/calendar-data', [App\Http\Controllers\CalendarController::class, 'getCalendarData'])->name('calendar.data');

// --- RUTAS QUE REQUIEREN LOGIN (Dashboard, etc.) ---
Route::get('/dashboard', function () {
    // Redirigimos el dashboard principal a nuestro listado de cuentas
    return redirect()->route('admin.cuentas.index');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


// --- GRUPO DE RUTAS DE ADMINISTRACIÓN ---
Route::middleware(['auth'])->prefix('admin')->name('admin.')->group(function () {

    // Esto crea automáticamente todas las rutas para el CRUD de cuentas:
    // admin.cuentas.index, admin.cuentas.create, admin.cuentas.store, etc.
    Route::resource('cuentas', CuentaController::class);
    Route::post('cuentas/{cuenta}/import', [CuentaController::class, 'import'])->name('cuentas.import');

});


// Rutas de autenticación generadas por Breeze
require __DIR__.'/auth.php';