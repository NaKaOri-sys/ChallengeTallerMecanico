$(document).ready(function () {
    let desperfectos = [];
    $('.selectpicker').selectpicker();
    function agregarDesperfecto(descripcion, manoDeObra, tiempo, repuestos) {
        let repuestosHtml = "";
        repuestos.forEach(function (repuesto) {
            repuestosHtml += `<li class="repuesto">${repuesto}</li>`;
        });
        let row = `<tr>
                            <td>${descripcion}</td>
                            <td>${manoDeObra}</td>
                            <td>${tiempo}</td>
                            <td><ul>${repuestosHtml}</ul></td>
                            <td><button class="btn btn-danger btn-eliminar" type="button">Eliminar</button></td>
                        </tr>`;
        $('#tablaDesperfectos tbody').append(row);
    }

    $('#agregarDesperfecto').click(function () {
        let descripcion = $('#descripcion').val();
        let manoDeObra = $('#manoDeObra').val();
        let tiempo = $('#tiempo').val();
        let repuestosSeleccionados = $('#repuestos').val();

        agregarDesperfecto(descripcion, manoDeObra, tiempo, repuestosSeleccionados);

        desperfectos.push({ descripcion: descripcion, manoDeObra: manoDeObra, tiempo: tiempo, repuestos: repuestosSeleccionados });

        $('#descripcion').val('');
        $('#manoDeObra').val('');
        $('#tiempo').val('');
    });

    $('#guardarDesperfectos').click(function () {
        var desperfectos = [];
        if ($('#descripcion').val() === '') {
            alert("Por favor ingrese una descripción valida.")
            return;
        }
        if ($('#manoDeObra').val() <= 0) {
            alert("Por favor ingrese un valor mayor a 0.")
            return;
        }
        if ($('#tiempo').val() <= 0) {
            alert("Por favor ingrese un valor mayor a 0.")
            return;
        }
        if ($('#repuestos option:selected').length === 0) {
            alert("Por favor ingrese un desperfecto valido.")
            return;
        }
        $('#tablaDesperfectos tbody tr').each(function () {
            var descripcion = $(this).find('td:eq(0)').text();
            var manoDeObra = parseFloat($(this).find('td:eq(1)').text());
            var tiempo = parseInt($(this).find('td:eq(2)').text());
            var repuestos = [];

            $(this).find('.repuesto').each(function () {
                var nombre = $(this).text();

                repuestos.push({ Nombre: nombre});
            });

            var desperfecto = { Descripcion: descripcion, ManoDeObra: manoDeObra, Tiempo: tiempo, Repuestos: repuestos };
            desperfectos.push(desperfecto);
        });
        $.post("/Home/GenerateDesperfectos", {Desperfectos : desperfectos})
            .done(function () {
                $("#tablaDesperfectos tbody").empty();
                desperfectos = [];
                window.location.href = "/Presupuesto/Presupuesto";
            })
            .fail(function () {
                window.location.href = "/Home/Error";
            })
    });

    $('#tablaDesperfectos').on('click', '.btn-eliminar', function () {
        let row = $(this).closest('tr');
        let index = row.index();

        desperfectos.splice(index, 1);
        row.remove();
    });
})