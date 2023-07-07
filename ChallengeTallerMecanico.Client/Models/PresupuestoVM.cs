using ChallengeTallerMecanico.Application.Dto;

namespace ChallengeTallerMecanico.Client.Models
{
    public class PresupuestoVM
    {
        public List<ClienteDto> Clientes { get; set; }
        public List<VehiculoResponseDto> Vehiculos { get; set; }
        public List<DesperfectoDto> Desperfectos { get; set; }
    }
}
