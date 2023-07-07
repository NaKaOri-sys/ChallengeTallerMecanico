$(document).ready(function () {
    let desperfectos = [];
    $('.selectpicker').selectpicker();
    $('#agregarDesperfecto').click(function () {
        var idDesperfecto = $('#desperfectos').val();
        var descripcion = $('#desperfectos option:selected').map(function () {
            return $(this).text();
        }).get().join(', ');

        // Verificar si se seleccionó al menos un desperfecto
        if (idDesperfecto.length > 0) {
            // Agregar el desperfecto a la tabla
            var row = '<tr><td class="desperfecto">' + idDesperfecto + '</td><td>' + descripcion + '</td><td><button class="btn btn-danger btn-eliminar" type="button">Eliminar</button></td></tr>';
            $('#tablaDesperfectos tbody').append(row);
        }
    });

    $('#send-btn').click(function () {
        let desperfectos = [];
        let clienteId = $('#clientes').val();
        let vehiculoId = $('#vehiculos').val();
        if (clienteId === '') {
            alert("Por favor ingrese un cliente valido.")
            return;
        }
        if (vehiculoId === '') {
            alert("Por favor ingrese un vehiculo valido.")
            return;
        }
        if ($('#desperfectos option:selected').length === 0) {
            alert("Por favor ingrese un desperfecto valido.")
            return;
        }
        $('#tablaDesperfectos tbody tr').each(function () {
            $(this).find('.desperfecto').each(function () {
                let id = $(this).text();
                let ids = id.split(",");

                for (let i = 0; i < ids.length; i++) {
                    let id = parseInt(ids[i]);
                    desperfectos.push(id);
                }
            });
        });
        let Presupuesto = {
            IdCliente: clienteId,
            IdVehiculo: vehiculoId,
            Desperfectos: desperfectos
        };

        $.post("/Presupuesto/EmitirPresupuesto", Presupuesto)
            .done(function () {
                $("#tablaDesperfectos tbody").empty();
                desperfectos = [];
                window.location.href = "/Presupuesto/PresupuestoEmitido";
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