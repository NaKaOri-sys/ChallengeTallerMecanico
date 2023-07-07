using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.DataAccess;
using EjercicioPOO.Application.Exceptions;
using System.Data;

namespace ChallengeTallerMecanico.Application.Services.Repuesto
{
    public class RepuestoService : IRepuestoService
    {
        private readonly BaseDataAccess _dataAccess;
        public RepuestoService()
        {
            _dataAccess = BaseDataAccess.Instance;
        }

        public List<RepuestoNoCargadoDto> MassiveCharge()
        {
            var repuestosNoCargados = new List<RepuestoNoCargadoDto>();
            try
            {
                var dtRepuestosNoCargados = _dataAccess.ExecuteQuery("EXEC [ChallengeTallerMecanico]..MassiveCharge");
                if (dtRepuestosNoCargados.Rows.Count == 0)
                {
                    throw new NotFoundException("No se encontraron repuestos cargados en la tabla temporal.");
                }
                foreach (DataRow row in dtRepuestosNoCargados.Rows)
                {
                    var repuesto = new RepuestoNoCargadoDto
                    {
                        Nombre = row["Nombre"].ToString(),
                        Precio = double.Parse(row["Precio"].ToString())
                    };
                    repuestosNoCargados.Add(repuesto);
                }

                return repuestosNoCargados;
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public List<RepuestoDto> GetAllRepuesto()
        {
            var repuestos = new List<RepuestoDto>();
            try
            {
                var dtRepuestos = _dataAccess.ExecuteQuery("SELECT TOP 10 * FROM [ChallengeTallerMecanico]..Repuesto");
                if (dtRepuestos.Rows.Count == 0)
                {
                    throw new NotFoundException("No se encontraron repuestos cargados.");
                }
                foreach (DataRow row in dtRepuestos.Rows)
                {
                    var repuesto = new RepuestoDto
                    {
                        Nombre = row["Nombre"].ToString(),
                        Precio = double.Parse(row["Precio"].ToString())
                    };
                    repuestos.Add(repuesto);
                }

                return repuestos;
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public RepuestoDto GetRepuesto(int Id)
        {
            try
            {
                var dtRepuestos = _dataAccess.ExecuteQuery("SELECT TOP 10 * FROM [ChallengeTallerMecanico]..Repuesto");
                if (dtRepuestos.Rows.Count == 0)
                {
                    throw new NotFoundException("No se encontraron repuestos cargados.");
                }
                var repuesto = new RepuestoDto
                {
                    Nombre = dtRepuestos.Rows[0]["Nombre"].ToString(),
                    Precio = double.Parse(dtRepuestos.Rows[0]["Precio"].ToString())
                };


                return repuesto;
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public void DeleteRepuesto(int Id)
        {
            try
            {
                _dataAccess.ExecuteNonQuery("DELETE FROM [ChallengeTallerMecanico]..Repuesto WHERE Id =" + Id);
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }
    }
}
