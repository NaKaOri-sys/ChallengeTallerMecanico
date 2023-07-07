using ChallengeTallerMecanico.Application.Enums;

namespace ChallengeTallerMecanico.Application.Dto
{
    public class AutomovilDto : VehiculoDto
    {
        public AutomovilDto(TipoAutomovilEnum tipoAutomovil, int cantidadPuertas) : base(TipoVehiculoEnum.Automovil)
        {
            TipoAutomovil = tipoAutomovil;
            CantidadPuertas = cantidadPuertas;
        }
        public int CantidadPuertas { get; set; }
        public TipoAutomovilEnum TipoAutomovil { get; set; }
    }
}
