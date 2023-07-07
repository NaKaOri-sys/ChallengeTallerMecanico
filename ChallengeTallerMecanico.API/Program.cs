using ChallengeTallerMecanico.Application.Services.Cliente;
using ChallengeTallerMecanico.Application.Services.Desperfecto;
using ChallengeTallerMecanico.Application.Services.Presupuesto;
using ChallengeTallerMecanico.Application.Services.Repuesto;
using ChallengeTallerMecanico.Application.Services.Vehiculo;
using ChallengeTallerMecanico.DataAccess;
using EjercicioPOO.Application.CustomExceptionMiddleware;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddScoped<IVehiculoService, VehiculoService>();
builder.Services.AddScoped<IRepuestoService, RepuestoService>();
builder.Services.AddScoped<IDesperfectoService, DesperfectoService>();
builder.Services.AddScoped<IClienteService, ClienteService>();
builder.Services.AddScoped<IPresupuestoService, PresupuestoService>();
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
var connection = builder.Configuration.GetConnectionString("TallerConnection");
BaseDataAccess.Configure(connection);


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
var logger = app.Services.GetRequiredService<ILogger<ExceptionMiddleware>>();
app.UseMiddleware<ExceptionMiddleware>();
app.UseAuthorization();

app.MapControllers();

app.Run();
