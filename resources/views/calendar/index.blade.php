@extends('layouts.public')

@section('sidebar-content')
    <h2 class="mb-4">Insta-Calendar</h2>
            
    <div class="form-group">
        <label for="cuenta-selector" class="form-label fw-bold">Seleccionar Cuenta:</label>
        <select id="cuenta-selector" class="form-select">
            @forelse($cuentas as $cuenta)
                <option value="{{ $cuenta->id }}">{{ $cuenta->nombre_cuenta }}</option>
            @empty
                <option disabled>No hay cuentas disponibles</option>
            @endforelse
        </select>
    </div>

    <div class="nav-controls text-center">
        <h4 id="current-month-year" class="mb-3"></h4>
        <div class="btn-group w-100" role="group">
            <button id="prev-month" class="btn btn-outline-secondary">&lt; Mes Anterior</button>
            <button id="today" class="btn btn-outline-primary">Hoy</button>
            <button id="next-month" class="btn btn-outline-secondary">Mes Siguiente &gt;</button>
        </div>
        <div class="mt-3">
            <a href="{{ route('admin.cuentas.index') }}" class="btn btn-link">Ir a Administración</a>
        </div>
    </div>
@endsection

@section('main-content')
    <div class="table-responsive">
        <table class="table table-bordered calendar-table">
            <thead>
                <tr><th>Lunes</th><th>Martes</th><th>Miércoles</th><th>Jueves</th><th>Viernes</th><th>Sábado</th><th>Domingo</th></tr>
            </thead>
            <tbody id="calendar-body">
                {{-- Las celdas del calendario se generarán con JS --}}
            </tbody>
        </table>
    </div>
@endsection