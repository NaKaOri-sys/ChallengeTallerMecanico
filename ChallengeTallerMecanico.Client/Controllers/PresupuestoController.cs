using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Options;
using ChallengeTallerMecanico.Client.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System.Text;

namespace ChallengeTallerMecanico.Client.Controllers
{
    public class PresupuestoController : Controller
    {
        private readonly ApiOptions _options;

        public PresupuestoController(IOptions<ApiOptions> options)
        {
            _options = options.Value;
        }
        public async Task<IActionResult> Presupuesto(PresupuestoVM presupuesto)
        {
            try
            {
                var httpClient = new HttpClient();

                var clientes = await httpClient.GetAsync(_options.Cliente);
                clientes.EnsureSuccessStatusCode();
                var clientesDto = JsonConvert.DeserializeObject<List<ClienteDto>>(await clientes.Content.ReadAsStringAsync());
                var vehiculos = await httpClient.GetAsync(_options.Vehiculo);
                vehiculos.EnsureSuccessStatusCode();
                var vehiculosDto = JsonConvert.DeserializeObject<List<VehiculoResponseDto>>(await vehiculos.Content.ReadAsStringAsync());
                var desperfectos = await httpClient.GetAsync(_options.Desperfecto);
                desperfectos.EnsureSuccessStatusCode();
                var desperfectosDto = JsonConvert.DeserializeObject<List<DesperfectoDto>>(await desperfectos.Content.ReadAsStringAsync());

                presupuesto.Clientes = clientesDto;
                presupuesto.Vehiculos = vehiculosDto;
                presupuesto.Desperfectos = desperfectosDto;

                return View("Presupuestos", presupuesto);
            }
            catch (Exception ex)
            {
                TempData["Mensaje"] = ex.Message;
                return StatusCode(500, ex.Message);
            }
        }

        public async Task<IActionResult> PresupuestoEmitido(PresupuestoDto presupuesto)
        {
            try
            {
                var httpClient = new HttpClient();
                var Id = Request.Cookies["IdPresupuesto"].ToString();
                var response = await httpClient.GetAsync(_options.Presupuesto + "/" + Id);
                response.EnsureSuccessStatusCode();
                presupuesto = JsonConvert.DeserializeObject<PresupuestoDto>(await response.Content.ReadAsStringAsync());

                return View(presupuesto);
            }
            catch (Exception ex)
            {
                TempData["Mensaje"] = ex.Message;
                return StatusCode(500, ex.Message);
            }
        }

        public async Task<IActionResult> EmitirPresupuesto(PresupuestoRequestDto presupuesto)
        {
            try
            {
                var httpClient = new HttpClient();
                var requestJson = JsonConvert.SerializeObject(presupuesto);
                var content = new StringContent(requestJson, Encoding.UTF8, "application/json");

                var response = await httpClient.PostAsync(_options.Presupuesto, content);
                response.EnsureSuccessStatusCode();
                var dto = JsonConvert.DeserializeObject<PresupuestoDto>(await response.Content.ReadAsStringAsync());
                Response.Cookies.Append("IdPresupuesto", dto.Id.ToString());

                return RedirectToAction("PresupuestoEmitido");
            }
            catch (Exception ex)
            {
                TempData["Mensaje"] = ex.Message;
                return StatusCode(500, ex.Message);
            }
        }
    }
}
