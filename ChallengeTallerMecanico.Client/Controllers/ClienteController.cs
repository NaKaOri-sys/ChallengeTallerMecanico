using ChallengeTallerMecanico.Application.Options;
using ChallengeTallerMecanico.Client.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System.Text;

namespace ChallengeTallerMecanico.Client.Controllers
{
    public class ClienteController : Controller
    {
        private readonly ApiOptions _options;
        public ClienteController(IOptions<ApiOptions> options)
        {
            _options = options.Value;
        }
        public IActionResult Cliente()
        {
            return View();
        }

        public async Task<IActionResult> CreateCliente(ClienteVM cliente)
        {
            try
            {
                var httpClient = new HttpClient();
                var requestJson = JsonConvert.SerializeObject(cliente);
                var content = new StringContent(requestJson, Encoding.UTF8, "application/json");

                var response = await httpClient.PostAsync(_options.Cliente, content);
                response.EnsureSuccessStatusCode();

                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                TempData["Mensaje"] = ex.Message;
                return StatusCode(500, ex.Message);
            }
        }
    }
}
