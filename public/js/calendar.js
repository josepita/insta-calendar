$(document).ready(function() {
    // --- ESTADO DE LA APLICACIÓN ---
    let currentDate = new Date("2025-06-01"); // Apuntamos a Junio 2025 donde hay datos
    let currentYear = currentDate.getFullYear();
    let currentMonth = currentDate.getMonth() + 1; // 1-12
    let selectedAccountId = $('#cuenta-selector').val();

    const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    
    // --- LÓGICA PRINCIPAL ---
    function loadCalendar(year, month) {
        if (!selectedAccountId) {
            $('#calendar-body').empty().append('<tr><td colspan="7" class="text-center p-5">Por favor, selecciona una cuenta.</td></tr>');
            return;
        }

        // LLAMADA AJAX REAL AL BACKEND DE LARAVEL
        $.ajax({
            url: '/api/calendar-data',
            method: 'GET',
            data: {
                cuenta_id: selectedAccountId,
                year: year,
                month: month
            },
            dataType: 'json',
            success: function(response) {
                $('#prev-month').prop('disabled', !response.navigation.prev_enabled);
                $('#next-month').prop('disabled', !response.navigation.next_enabled);
                renderCalendar(year, month, response.posts);
            },
            error: function() {
                alert('Error al cargar los datos del calendario.');
                $('#calendar-body').empty().append('<tr><td colspan="7" class="text-center p-5 text-danger">No se pudieron cargar los datos.</td></tr>');
            }
        });
    }

    function renderCalendar(year, month, posts) {
        $('#current-month-year').text(`${monthNames[month - 1]} ${year}`);
        const calendarBody = $('#calendar-body');
        calendarBody.empty();

        const firstDayOfMonth = new Date(year, month - 1, 1);
        const lastDayOfMonth = new Date(year, month, 0);
        
        let dayOfWeek = firstDayOfMonth.getDay();
        if (dayOfWeek === 0) dayOfWeek = 7;
        
        let dateIterator = new Date(firstDayOfMonth);
        dateIterator.setDate(dateIterator.getDate() - (dayOfWeek - 1));
        
        let done = false;
        while (!done) {
            let row = $('<tr></tr>');
            for (let i = 0; i < 7; i++) {
                const cell = $('<td></td>');
                const day = dateIterator.getDate();
                
                if (dateIterator.getMonth() !== month - 1) {
                    cell.addClass('other-month');
                }

                cell.append(`<div class="day-number">${day}</div>`);
                
                if (posts[day] && dateIterator.getMonth() === month - 1) {
                    const postsContainer = $('<div class="posts-container"></div>');
                    posts[day].forEach(post => postsContainer.append(createPostBlock(post)));
                    cell.append(postsContainer);
                }

                row.append(cell);
                dateIterator.setDate(dateIterator.getDate() + 1);
            }
            calendarBody.append(row);
            if (dateIterator.getDay() === 1 && dateIterator > lastDayOfMonth) done = true;
        }
    }

    function createPostBlock(post) {
        let typeClass, typeText;
        switch (post.type) {
            case "Video": typeClass = 'post-video'; typeText = '🎬 Reel'; break;
            case "Image": typeClass = 'post-image'; typeText = '🖼️ Imagen'; break;
            case "Sidecar": typeClass = 'post-sidecar'; typeText = '🎠 Carrusel'; break;
        }
        const statsHtml = `👍 ${post.likes_count} 💬 ${post.comments_count} ${post.video_play_count > 0 ? `👁️ ${post.video_play_count}` : ''}`;
        return $(`<div class="post-block ${typeClass}" data-bs-toggle="modal" data-bs-target="#postModal"><p class="post-caption">${post.caption}</p><p class="post-meta-type">${typeText}</p><p class="post-meta-stats">${statsHtml}</p></div>`).data('post', post);
    }

    // --- MANEJADORES DE EVENTOS ---
    function handleAccountChange() {
        selectedAccountId = $(this).val();
        loadCalendar(currentYear, currentMonth);
    }

    function handlePrevMonth() {
        currentMonth--;
        if (currentMonth < 1) { currentMonth = 12; currentYear--; }
        loadCalendar(currentYear, currentMonth);
    }

    function handleNextMonth() {
        currentMonth++;
        if (currentMonth > 12) { currentMonth = 1; currentYear++; }
        loadCalendar(currentYear, currentMonth);
    }

    function handleToday() {
        const today = new Date();
        currentYear = today.getFullYear();
        currentMonth = today.getMonth() + 1;
        loadCalendar(currentYear, currentMonth);
    }

    function populateModal(event) {
        const post = $(event.relatedTarget).data('post');
        const modal = $(this);

        modal.find('.modal-caption').text(post.caption);
        modal.find('.modal-stats').html(`👍 ${post.likes_count} &nbsp;&nbsp; 💬 ${post.comments_count} &nbsp;&nbsp; ${post.video_play_count > 0 ? `👁️ ${post.video_play_count}` : ''}`);
        modal.find('.instagram-link').attr('href', post.url);

        const imageContainer = modal.find('.modal-image-container');
        imageContainer.empty();

        if (post.type === 'Sidecar' && post.images && post.images.length > 0) {
            const imagesArray = (typeof post.images === 'string') ? JSON.parse(post.images) : post.images;
            const carouselId = `carousel_${post.id}`;
            let carouselHtml = `<div id="${carouselId}" class="carousel slide" data-bs-ride="carousel"><div class="carousel-inner">`;
            imagesArray.forEach((img, index) => {
                carouselHtml += `<div class="carousel-item ${index === 0 ? 'active' : ''}"><img src="${img}" class="d-block w-100" alt="Imagen ${index + 1}"></div>`;
            });
            carouselHtml += `</div><button class="carousel-control-prev" type="button" data-bs-target="#${carouselId}" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span></button><button class="carousel-control-next" type="button" data-bs-target="#${carouselId}" data-bs-slide="next"><span class="carousel-control-next-icon"></span></button></div>`;
            imageContainer.html(carouselHtml);
        } else {
            imageContainer.html(`<img src="${post.display_url}" class="img-fluid w-100" alt="Imagen del post">`);
        }
    }

    // --- INICIALIZACIÓN ---
    $('#cuenta-selector').on('change', handleAccountChange);
    $('#prev-month').on('click', handlePrevMonth);
    $('#next-month').on('click', handleNextMonth);
    $('#today').on('click', handleToday);
    $('#postModal').on('show.bs.modal', populateModal);

    loadCalendar(currentYear, currentMonth);
});