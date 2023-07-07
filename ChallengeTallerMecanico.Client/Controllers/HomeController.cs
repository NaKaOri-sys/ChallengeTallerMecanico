using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Options;
using ChallengeTallerMecanico.Client.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System.Text;

namespace ChallengeTallerMecanico.Client.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApiOptions _options;

        public HomeController(ILogger<HomeController> logger, IOptions<ApiOptions> options)
        {
            _logger = logger;
            _options = options.Value;
        }

        public IActionResult Index(VehiculoVM vehiculo)
        {
            return View(vehiculo);
        }

        public async Task<IActionResult> Desperfecto(DesperfectoVM desperfecto)
        {
            var httpClient = new HttpClient();
            try
            {
                var response = await httpClient.GetAsync(_options.Repuesto);
                response.EnsureSuccessStatusCode();
                var listaRepuestos = JsonConvert.DeserializeObject<List<RepuestoDto>>(await response.Content.ReadAsStringAsync());
                desperfecto.Repuestos = listaRepuestos;

                return View(desperfecto);
            }
            catch (Exception ex)
            {
                TempData["Mensaje"] = ex.Message;
                return StatusCode(500, ex.Message);
            }
        }

        public async Task<IActionResult> GenerateDesperfectos(DesperfectoVM[] desperfectos)
        {
            try
            {
                var httpClient = new HttpClient();
                foreach (var desperfecto in desperfectos)
                {
                    var requestJson = JsonConvert.SerializeObject(desperfecto);
                    var content = new StringContent(requestJson, Encoding.UTF8, "application/json");

                    var response = await httpClient.PostAsync(_options.Desperfecto, content);
                    response.EnsureSuccessStatusCode();
                }
                return RedirectToAction("Presupuesto", "Presupuesto");
            }
            catch (Exception ex)
            {
                TempData["Mensaje"] = ex.Message;
                return StatusCode(500, ex.Message);
            }
        }

        public async Task<IActionResult> IngresoVehiculo(VehiculoVM vehiculo)
        {
            try
            {
                var httpClient = new HttpClient();
                VehiculoDto requestBody = vehiculo.Tipo switch
                {
                    Application.Enums.TipoVehiculoEnum.Automovil => new AutomovilDto(vehiculo.TipoAuto, vehiculo.CantidadPuertas)
                    {
                        Marca = vehiculo.Marca,
                        Modelo = vehiculo.Modelo,
                        Patente = vehiculo.Patente
                    },
                    Application.Enums.TipoVehiculoEnum.Moto => new MotoDto(vehiculo.Cilindrada)
                    {
                        Marca = vehiculo.Marca,
                        Modelo = vehiculo.Modelo,
                        Patente = vehiculo.Patente
                    },
                    _ => throw new Exception("Tipo de vehiculo no soportado."),
                };
                var endpoint = requestBody.Tipo == Application.Enums.TipoVehiculoEnum.Automovil ? "/automovil" : "/moto";
                var requestJson = JsonConvert.SerializeObject(requestBody);
                var content = new StringContent(requestJson, Encoding.UTF8, "application/json");

                var response = await httpClient.PostAsync(_options.Vehiculo + endpoint, content);
                response.EnsureSuccessStatusCode();

                return RedirectToAction("Desperfecto");

            }
            catch (Exception ex)
            {
                TempData["Mensaje"] = ex.Message;
                return StatusCode(500, ex.Message);
            }
        }
        public IActionResult Error(ErrorViewModel error)
        {
            error.ErrorMessage = TempData["Mensaje"].ToString();
            return View(error);
        }
    }
}