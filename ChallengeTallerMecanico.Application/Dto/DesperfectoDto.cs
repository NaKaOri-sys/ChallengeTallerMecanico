namespace ChallengeTallerMecanico.Application.Dto
{
    public class DesperfectoDto
    {
        public DesperfectoDto(List<RepuestoDto> repuestos)
        {
            Repuestos = repuestos;
        }
        public DesperfectoDto()
        {

        }
        public int? IdPresupuesto { get; set; }
        public int? Id { get; set; }
        public string Descripcion { get; set; }
        public double ManoDeObra { get; set; }
        public int Tiempo { get; set; }
        public List<RepuestoDto> Repuestos { get; set; }
    }
}
