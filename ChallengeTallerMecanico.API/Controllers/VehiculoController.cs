using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Services.Vehiculo;
using EjercicioPOO.Application.Exceptions;
using Microsoft.AspNetCore.Mvc;

namespace ChallengeTallerMecanico.API.Controllers
{
    [Route("api/vehiculo")]
    [ApiController]
    public class VehiculoController : ControllerBase
    {
        private readonly IVehiculoService _vehiculo;

        public VehiculoController(IVehiculoService vehiculo)
        {
            _vehiculo = vehiculo;
        }

        [HttpGet]
        public List<VehiculoResponseDto> GetAll()
        {
            var response = _vehiculo.GetAllVehiculos();
            return response;
        }

        [HttpGet("{id}")]
        public VehiculoResponseDto GetAuto(int id)
        {
            if (id <= 0)
            {
                throw new BadRequestException("id debe ser mayor a 0.");
            }
            var response = _vehiculo.GetVehiculo(id);

            return response;
        }


        [HttpPost("automovil")]
        public IActionResult IngresarAutomovil(AutomovilDto automovilDto)
        {
            if (!ModelState.IsValid)
            {
                throw new BadRequestException("Error en los datos de entrada.");
            }
            _vehiculo.CrearVehiculo(automovilDto);

            return Ok();
        }

        [HttpPost("moto")]
        public IActionResult IngresarMoto(MotoDto motoDto)
        {
            if (!ModelState.IsValid)
            {
                throw new BadRequestException("Error en los datos de entrada.");
            }
            _vehiculo.CrearVehiculo(motoDto);

            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                throw new BadRequestException("id debe ser mayor a 0.");
            }
            _vehiculo.DeleteVehiculo(id);

            return Ok();
        }
    }
}
