<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insta-Calendar</title>
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('css/calendar.css') }}">
</head>
<body>

    <div class="main-container">
        <!-- BARRA LATERAL (SIDEBAR) -->
        <aside id="sidebar">
            @yield('sidebar-content')
        </aside>

        <!-- CONTENIDO PRINCIPAL -->
        <main id="main-content">
            @yield('main-content')
        </main>
    </div>

    <!-- VENTANA MODAL PARA MOSTRAR EL POST -->
    @include('partials.post-modal')

    <!-- jQuery y Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script src="{{ asset('js/calendar.js') }}"></script>
</body>
</html>