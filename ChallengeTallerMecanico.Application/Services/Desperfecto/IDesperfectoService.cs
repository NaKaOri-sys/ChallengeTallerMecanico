using ChallengeTallerMecanico.Application.Dto;

namespace ChallengeTallerMecanico.Application.Services.Desperfecto
{
    public interface IDesperfectoService
    {
        DesperfectoDto CreateDesperfecto(DesperfectoDto desperfecto);
        DesperfectoDto GetDesperfecto(int id);
        List<DesperfectoDto> GetAll();
        void DeleteDesperfecto(int Id);
    }
}