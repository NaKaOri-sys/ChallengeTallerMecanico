using ChallengeTallerMecanico.Application.Dto;

namespace ChallengeTallerMecanico.Client.Models
{
    public class DesperfectoVM
    {
        public string Descripcion { get; set; }
        public double ManoDeObra { get; set; }
        public int Tiempo { get; set; }
        public List<RepuestoDto> Repuestos { get; set; }
    }
}
