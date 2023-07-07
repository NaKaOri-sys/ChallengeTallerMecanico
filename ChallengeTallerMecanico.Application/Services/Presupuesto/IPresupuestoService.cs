using ChallengeTallerMecanico.Application.Dto;

namespace ChallengeTallerMecanico.Application.Services.Presupuesto
{
    public interface IPresupuestoService
    {
        PresupuestoDto CreatePresupuesto(PresupuestoRequestDto presupuesto);
        PresupuestoDto GetPresupuesto(int Id);
        void DeletePresupuesto(int Id);
    }
}