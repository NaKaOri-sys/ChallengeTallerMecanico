using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Enums;
using ChallengeTallerMecanico.Application.Services.Desperfecto;
using ChallengeTallerMecanico.DataAccess;
using EjercicioPOO.Application.Exceptions;
using System.Data;

namespace ChallengeTallerMecanico.Application.Services.Presupuesto
{
    public class PresupuestoService : IPresupuestoService
    {
        private readonly BaseDataAccess _dataAccess;
        private readonly IDesperfectoService _desperfectoService;
        public PresupuestoService(IDesperfectoService desperfectoService)
        {
            _dataAccess = BaseDataAccess.Instance;
            _desperfectoService = desperfectoService;
        }

        public PresupuestoDto CreatePresupuesto(PresupuestoRequestDto presupuesto)
        {
            try
            {
                CheckFksExist(presupuesto);
                double costoRepuestos = CalcularCostoRepuestos(presupuesto.Desperfectos);
                double costoManoDeObra = CalcularCostoManoDeObra(presupuesto.Desperfectos);
                double costoEstacionamiento = CalcularCostoEstacionamiento(presupuesto.Desperfectos);
                double costoTotal = costoRepuestos + costoManoDeObra + costoEstacionamiento;
                double gananciaTaller = costoTotal * 0.1;
                double costoTotalPresupuesto = costoTotal + gananciaTaller;

                var dtPresupuesto = _dataAccess.ExecuteQuery($"DECLARE @IdPresupuesto bigint EXEC [ChallengeTallerMecanico]..CreatePresupuesto '{presupuesto.IdCliente}', '{presupuesto.IdVehiculo}', {costoTotalPresupuesto} \n SELECT @IdPresupuesto");
                if (dtPresupuesto.Rows.Count == 0)
                    throw new NotFoundException("No se pudo generar el Id del presupuesto");

                var idPresupuesto = int.Parse(dtPresupuesto.Rows[0]["ID"].ToString());
                InsertReferenceInDesperfecto(presupuesto, idPresupuesto);
                var dto = new PresupuestoDto
                {
                    Id = idPresupuesto
                };

                return dto;
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public void DeletePresupuesto(int Id)
        {
            try
            {
                _dataAccess.ExecuteNonQuery($"EXEC [ChallengeTallerMecanico]..DeletePresupuesto {Id}");
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public PresupuestoDto GetPresupuesto(int Id)
        {
            try
            {
                var dtPresupuesto = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..PresupuestoView WHERE Id ={Id}");
                if (dtPresupuesto.Rows.Count == 0)
                    throw new NotFoundException("No se encontro el presupuesto indicado.");

                var presupuestoDto = MapPresupuestoDto(dtPresupuesto.Rows[0], dtPresupuesto.Rows);

                return presupuestoDto;
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }


        private PresupuestoDto MapPresupuestoDto(DataRow dataRow, DataRowCollection rows)
        {
            var presupuesto = new PresupuestoDto
            {
                Id = int.Parse(dataRow["Id"].ToString()),
                Total = double.Parse(dataRow["Total"].ToString()),
                Vehiculo = new VehiculoResponseDto
                {
                    CantidadPuertas = int.Parse(dataRow["CantidadPuertas"].ToString()),
                    Id = int.Parse(dataRow["IdVehiculo"].ToString()),
                    Marca = dataRow["Marca"].ToString(),
                    Modelo = dataRow["Modelo"].ToString(),
                    Patente = dataRow["Patente"].ToString(),
                    Cilindrada = dataRow["Cilindrada"].ToString(),
                    TipoAutomovil = Enum.Parse<TipoAutomovilEnum>(dataRow["TipoAuto"].ToString())
                },
                Cliente = new ClienteDto
                {
                    Id = int.Parse(dataRow["IdCliente"].ToString()),
                    Nombre = dataRow["Nombre"].ToString(),
                    Apellido = dataRow["Apellido"].ToString(),
                    Email = dataRow["Email"].ToString()
                }
            };
            var desperfectos = new List<DesperfectoDto>();
            foreach (DataRow item in rows)
            {
                var desperfecto = _desperfectoService.GetDesperfecto(int.Parse(item["IdDesperfecto"].ToString()));
                desperfectos.Add(desperfecto);
            }
            presupuesto.Desperfectos = desperfectos;

            return presupuesto;
        }

        private void InsertReferenceInDesperfecto(PresupuestoRequestDto presupuesto, int idPresupuesto)
        {
            foreach (var id in presupuesto.Desperfectos)
            {
                _dataAccess.ExecuteNonQuery($"UPDATE Desperfecto SET IdPresupuesto = {idPresupuesto} WHERE Id = {id}");
            }
        }

        private double CalcularCostoEstacionamiento(int[] desperfectos)
        {
            double costoEstacionamiento = 0;
            foreach (var id in desperfectos)
            {
                var desperfecto = _desperfectoService.GetDesperfecto(id);
                costoEstacionamiento += desperfecto.Tiempo * 130;
            }
            return costoEstacionamiento;
        }

        private double CalcularCostoManoDeObra(int[] desperfectos)
        {
            double costoManoDeObra = 0;
            foreach (var id in desperfectos)
            {
                var desperfecto = _desperfectoService.GetDesperfecto(id);
                costoManoDeObra += desperfecto.ManoDeObra;
            }
            return costoManoDeObra;
        }

        private double CalcularCostoRepuestos(int[] desperfectos)
        {
            double costoRepuestos = 0;
            foreach (var id in desperfectos)
            {
                var desperfecto = _desperfectoService.GetDesperfecto(id);
                foreach (var repuesto in desperfecto.Repuestos)
                {
                    costoRepuestos += repuesto.Precio;
                }
            }
            return costoRepuestos;
        }

        private void CheckFksExist(PresupuestoRequestDto presupuesto)
        {
            var dtVehiculos = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..VehiculosView WHERE Id ={presupuesto.IdVehiculo}");
            if (dtVehiculos.Rows.Count == 0)
                throw new NotFoundException("No se encuentra la entidad solicitada.");

            var dtCliente = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..Cliente WHERE Id = {presupuesto.IdCliente}");
            if (dtCliente.Rows.Count == 0)
                throw new BadRequestException("El cliente indicado no existe.");
        }
    }
}
