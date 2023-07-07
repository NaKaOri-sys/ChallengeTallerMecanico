using ChallengeTallerMecanico.Application.Enums;

namespace ChallengeTallerMecanico.Application.Dto
{
    public abstract class VehiculoDto
    {
        public VehiculoDto(TipoVehiculoEnum tipo)
        {
            Tipo = tipo;
        }
        public VehiculoDto()
        {
        }
        public int? IdVehiculo { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string Patente { get; set; }
        public TipoVehiculoEnum Tipo { get; set; }
    }
}
