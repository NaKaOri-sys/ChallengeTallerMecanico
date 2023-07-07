using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Services.Presupuesto;
using EjercicioPOO.Application.Exceptions;
using Microsoft.AspNetCore.Mvc;

namespace ChallengeTallerMecanico.API.Controllers
{
    [Route("api/presupuesto")]
    [ApiController]
    public class PresupuestoController : ControllerBase
    {
        private readonly IPresupuestoService _presupuestoService;

        public PresupuestoController(IPresupuestoService presupuestoService)
        {
            _presupuestoService = presupuestoService;
        }

        [HttpGet("{id}")]
        public PresupuestoDto Get(int id)
        {
            if (id <= 0)
                throw new BadRequestException("id debe ser mayor a 0.");
            var response = _presupuestoService.GetPresupuesto(id);

            return response;
        }

        [HttpPost]
        public IActionResult Post(PresupuestoRequestDto request)
        {
            if (request.IdCliente <= 0 || request.IdVehiculo <= 0 || request.Desperfectos.Length == 0)
            {
                throw new BadRequestException("Error en los datos de entrada");
            }
            var response = _presupuestoService.CreatePresupuesto(request);

            return Ok(response);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
                throw new BadRequestException("id debe ser mayor a 0.");
            _presupuestoService.DeletePresupuesto(id);

            return Ok();
        }
    }
}
