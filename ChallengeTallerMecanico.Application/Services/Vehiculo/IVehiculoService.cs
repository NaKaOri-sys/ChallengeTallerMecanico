using ChallengeTallerMecanico.Application.Dto;

namespace ChallengeTallerMecanico.Application.Services.Vehiculo
{
    public interface IVehiculoService
    {
        void CrearVehiculo(VehiculoDto request);
        List<VehiculoResponseDto> GetAllVehiculos();
        public VehiculoResponseDto GetVehiculo(int Id);
        void DeleteVehiculo(int Id);
    }
}