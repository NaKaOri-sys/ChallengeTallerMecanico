$(document).ready(function () {
    $("#tipoVehiculo").change(function () {
        var selectedOption = $(this).val();

        if (selectedOption === "Automovil") {
            $("#camposAdicionales").show();
            $("#cantidadPuertas").show();
            $("#tipoAuto").show();
            $("#cilindrada").hide();
        } else if (selectedOption === "Moto") {
            $("#camposAdicionales").show();
            $("#cantidadPuertas").hide();
            $("#tipoAuto").hide();
            $("#cilindrada").show();
        } else {
            $("#camposAdicionales").hide();
        }
    });
})

$('#btn-save').click(function () {
    var vehiculo =
    {
        "Marca": $('#marca').val(),
        "Modelo": $('#modelo').val(),
        "Patente": $('#patente').val(),
        "Tipo": $('#tipoVehiculo').val(),
        "TipoAuto": $('#TipoAuto').val(),
        "CantidadPuertas": $('#CantidadPuertas').val(),
        "Cilindrada": $('#Cilindrada').val()
    };

    $.post("/Home/IngresoVehiculo", vehiculo)
        .done(function () {
            window.location.href = "/Home/Desperfecto";
        })
        .fail(function (xhr, status, error) {
                window.location.href = "/Home/Error";
        });
});

$.validator.addMethod("camposAdicionalesRequeridos", function (value, element) {
    var tipoVehiculo = $("#Tipo").val();

    if (tipoVehiculo === "Automovil") {
        return value.trim() !== ""; // El campo es requerido si no está vacío
    } else if (tipoVehiculo === "Moto") {
        return value.trim() !== ""; // El campo es requerido si no está vacío
    }

    return true;
});