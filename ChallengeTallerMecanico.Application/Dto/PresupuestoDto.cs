namespace ChallengeTallerMecanico.Application.Dto
{
    public class PresupuestoDto
    {
        public int Id { get; set; }
        public double Total { get; set; }
        public VehiculoResponseDto Vehiculo { get; set; }
        public ClienteDto Cliente { get; set; }
        public List<DesperfectoDto> Desperfectos { get; set; }
    }
}
