using ChallengeTallerMecanico.Application.Dto;

namespace ChallengeTallerMecanico.Application.Services.Repuesto
{
    public interface IRepuestoService
    {
        List<RepuestoNoCargadoDto> MassiveCharge();
        List<RepuestoDto> GetAllRepuesto();
        RepuestoDto GetRepuesto(int Id);
        void DeleteRepuesto(int Id);
    }
}