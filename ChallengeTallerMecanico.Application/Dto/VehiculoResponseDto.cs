using ChallengeTallerMecanico.Application.Enums;

namespace ChallengeTallerMecanico.Application.Dto
{
    public class VehiculoResponseDto
    {
        public int Id { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string Patente { get; set; }
        public TipoAutomovilEnum TipoAutomovil { get; set; }
        public int CantidadPuertas { get; set; }
        public string Cilindrada { get; set; }
    }
}
