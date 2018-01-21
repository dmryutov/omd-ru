$('#city').change(function() {
    var city = $(this).val();

    // Make AJAX request to backend
    jQuery.ajax({
        type: 'GET',
        url: '/change_city/',
        data: (city == 0) ? {} : { city },
        success(data) {
            const stat = JSON.parse(data.stat);

            // Update graph data
            myChart.data.labels = stat.map(val => val.city__name);
            myChart.data.datasets[0].data = stat.map(val => val.Hyundai);
            myChart.data.datasets[1].data = stat.map(val => val.Kia);
            myChart.update();

            // Resize graph and stat table
            if (city == 0) {
                $('#statTable').parent().removeClass('col-lg-4').addClass('col-lg-12');
                $('#myChart').removeClass('col-lg-8').addClass('col-lg-12');
            }
            else {
                $('#statTable').parent().removeClass('col-lg-12').addClass('col-lg-4');
                $('#myChart').removeClass('col-lg-12').addClass('col-lg-8');
            }

            // Update stat table
            $('#statTable tbody tr').remove();
            stat.map(val => {
                $('#statTable tbody').append(`<tr>
                    <td>${val.city__name}</td>
                    <td>${val.Hyundai || 0}</td>
                    <td>${val.Kia || 0}</td>
                </tr>`);
            });

            // Update dealers table
            $('#dealerTable tbody tr').remove();
            data.data.map(val => {
                $('#dealerTable tbody').append(`<tr>
                    <td>${val.brand}</td>
                    <td>${val.name}</td>
                    <td>${val.city}</td>
                    <td>${val.address}</td>
                    <td>${val.phone}</td>
                    <td><a href="${val.site}">${val.site}</a></td>
                </tr>`);
            });
        },
        error(jqXHR, textStatus, errorThrown) {
            alert('Произошла ошибка при загрузке статистики по городу!');
            console.log(jqXHR, textStatus, errorThrown);
        }
    });
});
