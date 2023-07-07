$('#save-btn').click(function () {
    let cliente =
    {
        Nombre: $('#Nombre').val(),
        Apellido: $('#Apellido').val(),
        Email: $('#Email').val()
    };
    console.log(cliente)
    $.post("/Cliente/CreateCliente", cliente)
        .done(function () {
            window.location.href = "/Home/Index";
        })
        .fail(function (xhr, status, error) {
            window.location.href = "/Home/Error";
        });
})