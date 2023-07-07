using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Services.Repuesto;
using EjercicioPOO.Application.Exceptions;
using Microsoft.AspNetCore.Mvc;

namespace ChallengeTallerMecanico.API.Controllers
{
    [Route("api/repuesto")]
    [ApiController]
    public class RepuestoController : ControllerBase
    {
        private readonly IRepuestoService _repuesto;
        public RepuestoController(IRepuestoService repuesto)
        {
            _repuesto = repuesto;
        }

        [HttpGet]
        public List<RepuestoDto> GetAll()
        {
            var response = _repuesto.GetAllRepuesto();

            return response;
        }

        [HttpGet("{id}")]
        public RepuestoDto Get(int id)
        {
            if (id < 0)
            {
                throw new BadRequestException("id debe ser mayor que 0.");
            }
            var response = _repuesto.GetRepuesto(id);

            return response;
        }

        [HttpPost]
        public List<RepuestoNoCargadoDto> Post()
        {
            var response = _repuesto.MassiveCharge();

            return response;
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id < 0)
            {
                throw new BadRequestException("id debe ser mayor que 0.");
            }
            _repuesto.DeleteRepuesto(id);

            return Ok();
        }
    }
}
