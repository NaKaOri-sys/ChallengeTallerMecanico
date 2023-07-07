using ChallengeTallerMecanico.Application.Enums;

namespace ChallengeTallerMecanico.Client.Models
{
    public class VehiculoVM
    {
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string Patente { get; set; }
        public TipoVehiculoEnum Tipo { get; set; }
        public int CantidadPuertas { get; set; }
        public TipoAutomovilEnum TipoAuto { get; set; }
        public string Cilindrada { get; set; }
    }
}
