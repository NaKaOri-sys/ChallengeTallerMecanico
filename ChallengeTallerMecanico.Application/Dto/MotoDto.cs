using ChallengeTallerMecanico.Application.Enums;

namespace ChallengeTallerMecanico.Application.Dto
{
    public class MotoDto : VehiculoDto
    {
        public MotoDto(string cilindrada) : base(TipoVehiculoEnum.Moto)
        {
            Cilindrada = cilindrada;
        }

        public string Cilindrada { get; set; }
    }
}
