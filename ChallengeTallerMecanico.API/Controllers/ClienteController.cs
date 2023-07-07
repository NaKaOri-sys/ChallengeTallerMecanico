using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Services.Cliente;
using EjercicioPOO.Application.Exceptions;
using Microsoft.AspNetCore.Mvc;

namespace ChallengeTallerMecanico.API.Controllers
{
    [Route("api/cliente")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        private readonly IClienteService _clienteService;

        public ClienteController(IClienteService clienteService)
        {
            _clienteService = clienteService;
        }

        [HttpGet]
        public List<ClienteDto> GetAll()
        {
            var response = _clienteService.GetAll();

            return response;
        }

        [HttpGet("{id}")]
        public ClienteDto Get(int id)
        {
            var response = _clienteService.GetCliente(id);

            return response;
        }

        [HttpPost]
        public IActionResult Post(ClienteRequestDto cliente)
        {
            if (!ModelState.IsValid)
                throw new BadRequestException("Error en los datos de entrada");

            _clienteService.CreateCliente(cliente);

            return Ok();
        }

        [HttpPut]
        public IActionResult Put(ClienteDto cliente)
        {
            if (cliente.Id < 0)
                throw new BadRequestException("Id debe ser mayor a 0.");
            _clienteService.UpdateCliente(cliente);

            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id < 0)
                throw new BadRequestException("Id debe ser mayor a 0.");
            _clienteService.DeleteCliente(id);

            return Ok();
        }
    }
}
