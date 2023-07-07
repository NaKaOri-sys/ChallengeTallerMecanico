namespace ChallengeTallerMecanico.Application.Dto
{
    public class PresupuestoRequestDto
    {
        public int IdCliente { get; set; }
        public int IdVehiculo { get; set; }
        public int[] Desperfectos { get; set; }
    }
}
