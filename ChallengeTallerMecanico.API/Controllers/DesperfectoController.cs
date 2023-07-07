using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Services.Desperfecto;
using EjercicioPOO.Application.Exceptions;
using Microsoft.AspNetCore.Mvc;

namespace ChallengeTallerMecanico.API.Controllers
{
    [Route("api/desperfecto")]
    [ApiController]
    public class DesperfectoController : ControllerBase
    {
        private readonly IDesperfectoService _desperfectoService;

        public DesperfectoController(IDesperfectoService desperfectoService)
        {
            _desperfectoService = desperfectoService;
        }

        [HttpGet]
        public List<DesperfectoDto> GetAll()
        {
            var response = _desperfectoService.GetAll();

            return response;
        }

        [HttpGet("{id}")]
        public DesperfectoDto Get(int id)
        {
            if (id < 0)
            {
                throw new BadRequestException("id debe ser mayor que 0.");
            }
            var response = _desperfectoService.GetDesperfecto(id);

            return response;
        }

        [HttpPost]
        public IActionResult Post(DesperfectoDto desperfecto)
        {
            if (!ModelState.IsValid)
            {
                throw new BadRequestException("Error en los datos de entrada.");
            }
            _desperfectoService.CreateDesperfecto(desperfecto);

            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id < 0)
            {
                throw new BadRequestException("id debe ser mayor que 0.");
            }
            _desperfectoService.DeleteDesperfecto(id);

            return Ok();
        }
    }
}
