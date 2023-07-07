using ChallengeTallerMecanico.Application.Dto;

namespace ChallengeTallerMecanico.Application.Services.Cliente
{
    public interface IClienteService
    {
        void CreateCliente(ClienteRequestDto cliente);
        void UpdateCliente(ClienteDto cliente);
        ClienteDto GetCliente(int Id);
        List<ClienteDto> GetAll();
        void DeleteCliente(int Id);
    }
}