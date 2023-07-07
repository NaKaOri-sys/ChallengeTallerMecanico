using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.DataAccess;
using EjercicioPOO.Application.Exceptions;
using System.Data;

namespace ChallengeTallerMecanico.Application.Services.Desperfecto
{
    public class DesperfectoService : IDesperfectoService
    {
        private readonly BaseDataAccess _dataAccess;
        public DesperfectoService()
        {
            _dataAccess = BaseDataAccess.Instance;
        }

        public DesperfectoDto GetDesperfecto(int id)
        {
            try
            {
                var dtDesperfecto = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..DesperfectoView WHERE Id ={id}");
                if (dtDesperfecto.Rows.Count == 0)
                {
                    throw new NotFoundException("No se encuentra la entidad solicitada.");
                }

                var desperfectoDto = MapDesperfectoDto(dtDesperfecto.Rows[0], dtDesperfecto.Rows);

                return desperfectoDto;
            }
            catch (Exception ex)
            {

                throw new InternalErrorException(ex.Message);
            }
        }
        public List<DesperfectoDto> GetAll()
        {
            try
            {
                var dtDesperfecto = _dataAccess.ExecuteQuery($"SELECT TOP 10 * FROM [ChallengeTallerMecanico]..DesperfectoView ORDER BY Id DESC");
                if (dtDesperfecto.Rows.Count == 0)
                {
                    throw new NotFoundException("No se encuentra la entidad solicitada.");
                }
                var desperfectos = new List<DesperfectoDto>();
                foreach (DataRow row in dtDesperfecto.Rows)
                {
                    var desperfectoDto = MapDesperfectoDto(row, dtDesperfecto.Rows);
                    if (desperfectoDto != null)
                    {
                        desperfectos.Add(desperfectoDto);
                    }
                }

                return desperfectos;
            }
            catch (Exception ex)
            {

                throw new InternalErrorException(ex.Message);
            }
        }

        public void DeleteDesperfecto(int Id)
        {
            try
            {
                _dataAccess.ExecuteNonQuery($"EXEC [ChallengeTallerMecanico]..DeleteDesperfecto {Id}");
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        private DesperfectoDto MapDesperfectoDto(DataRow dataRow, DataRowCollection repuestosRows)
        {
            var desperfecto = new DesperfectoDto();
            var repuestos = new List<RepuestoDto>();

            desperfecto.Id = int.Parse(dataRow["Id"].ToString());
            desperfecto.IdPresupuesto = int.Parse(dataRow["IdPresupuesto"].ToString());
            desperfecto.Descripcion = dataRow["Descripcion"].ToString();
            desperfecto.ManoDeObra = double.Parse(dataRow["ManoDeObra"].ToString());
            desperfecto.Tiempo = int.Parse(dataRow["Tiempo"].ToString());

            foreach (DataRow item in repuestosRows)
            {
                var repuesto = new RepuestoDto
                {
                    Nombre = item["Nombre"].ToString(),
                    Precio = double.Parse(item["Precio"].ToString())
                };
                repuestos.Add(repuesto);
            }

            desperfecto.Repuestos = repuestos;

            return desperfecto;
        }


        public DesperfectoDto CreateDesperfecto(DesperfectoDto desperfecto)
        {
            try
            {
                var dtDesperfecto = _dataAccess.ExecuteQuery($"DECLARE @IdDesperfecto bigint EXEC [ChallengeTallerMecanico]..CreateDesperfecto '{desperfecto.Descripcion}', {desperfecto.ManoDeObra}, {desperfecto.Tiempo}, @IdDesperfecto \n SELECT @IdDesperfecto");
                if (dtDesperfecto.Rows.Count == 0)
                {
                    throw new NotFoundException("No se pudo generar el IdDesperfecto.");
                }
                desperfecto.Id = int.Parse(dtDesperfecto.Rows[0]["ID"].ToString());
                InsertRepuestosDesperfectos(desperfecto);

                return desperfecto;
            }
            catch (Exception ex)
            {

                throw new InternalErrorException(ex.Message);
            }
        }

        private void InsertRepuestosDesperfectos(DesperfectoDto desperfecto)
        {
            foreach (var repuesto in desperfecto.Repuestos)
            {
                _dataAccess.ExecuteQuery($"EXEC [ChallengeTallerMecanico]..CreateRepuestoDesperfecto '{repuesto.Nombre}', {desperfecto.Id}");
            }
        }
    }
}
