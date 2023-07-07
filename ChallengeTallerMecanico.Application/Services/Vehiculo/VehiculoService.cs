using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.Application.Enums;
using ChallengeTallerMecanico.DataAccess;
using EjercicioPOO.Application.Exceptions;
using System.Data;

namespace ChallengeTallerMecanico.Application.Services.Vehiculo
{
    public class VehiculoService : IVehiculoService
    {
        private readonly BaseDataAccess _dataAccess;

        public VehiculoService()
        {
            _dataAccess = BaseDataAccess.Instance;
        }

        public void DeleteVehiculo(int Id)
        {
            try
            {
                _dataAccess.ExecuteNonQuery($"EXEC [ChallengeTallerMecanico]..DeleteVehiculo {Id}");
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public void CrearVehiculo(VehiculoDto request)
        {
            try
            {
                var dtVehiculoExistente = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..VehiculosView WHERE Patente ='{request.Patente}' ");
                if (dtVehiculoExistente.Rows.Count > 0)
                {
                    throw new NotFoundException("El vehiculo ya se encuentra registrado.");
                }
                var dtVehiculo = _dataAccess.ExecuteQuery($"DECLARE @IdVehiculo bigint EXEC [ChallengeTallerMecanico]..CreateVehiculo '{request.Marca}', '{request.Modelo}', '{request.Patente}', '{request.Tipo}', @IdVehiculo \n SELECT @IdVehiculo ID");

                if (dtVehiculo.Rows.Count > 0)
                {
                    var IdVehiculo = dtVehiculo.Rows[0]["ID"].ToString();
                    request.IdVehiculo = int.Parse(IdVehiculo);
                    CreateTypeOfVehicle(request);
                }
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        private void CreateTypeOfVehicle(VehiculoDto request)
        {
            switch (request.Tipo)
            {
                case TipoVehiculoEnum.Automovil:
                    if (request is AutomovilDto automovil)
                    {
                        _dataAccess.ExecuteNonQuery($"EXEC [ChallengeTallerMecanico]..CreateAutomovil {request.IdVehiculo}, '{automovil.TipoAutomovil}', {automovil.CantidadPuertas}");
                        break;
                    }

                    throw new InternalErrorException("Hubo un error al generar el automovil.");
                case TipoVehiculoEnum.Moto:
                    if (request is MotoDto moto)
                    {
                        _dataAccess.ExecuteNonQuery($"EXEC [ChallengeTallerMecanico]..CreateMoto {request.IdVehiculo}, '{moto.Cilindrada}'");
                        break;
                    }
                    throw new InternalErrorException("Hubo un error al generar la moto.");
                default:
                    throw new NotFoundException("No se encontró el tipo de vehiculo seleccionado.");
            }
        }

        public VehiculoResponseDto GetVehiculo(int Id)
        {
            try
            {
                var dtVehiculos = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..VehiculosView WHERE Id ={Id}");
                if (dtVehiculos.Rows.Count == 0)
                {
                    throw new NotFoundException("No se encuentra la entidad solicitada.");
                }
                var vehiculos = new List<VehiculoResponseDto>();
                MapVehicleEntity(dtVehiculos.Rows[0], vehiculos);

                return vehiculos.FirstOrDefault();
            }
            catch (Exception ex)
            {

                throw new InternalErrorException(ex.Message);
            }
        }

        public List<VehiculoResponseDto> GetAllVehiculos()
        {
            try
            {
                var dtVehiculos = _dataAccess.ExecuteQuery("SELECT * FROM [ChallengeTallerMecanico]..VehiculosView");
                if (dtVehiculos.Rows.Count == 0)
                {
                    throw new NotFoundException("No se encontraron vehiculos guardados.");
                }
                var vehiculos = new List<VehiculoResponseDto>();
                BuildListVehicles(vehiculos, dtVehiculos.Rows);

                return vehiculos;
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        private void BuildListVehicles(List<VehiculoResponseDto> vehiculos, DataRowCollection rows)
        {
            foreach (DataRow row in rows)
            {
                MapVehicleEntity(row, vehiculos);
            }
        }

        private void MapVehicleEntity(DataRow row, List<VehiculoResponseDto> vehiculos)
        {
            var vehiculo = new VehiculoResponseDto();
            vehiculo.Id = int.Parse(row["Id"].ToString());
            vehiculo.Marca = row["Marca"].ToString();
            vehiculo.Modelo = row["Modelo"].ToString();
            vehiculo.Patente = row["Patente"].ToString();
            if (row["Tipo"].ToString() == "Automovil")
            {
                var tipoAutomovil = Enum.TryParse(row["TipoAutomovil"].ToString(), out TipoAutomovilEnum tipoAuto);
                var cantidadPuertas = int.Parse(row["CantidadPuertas"].ToString());
                vehiculo.CantidadPuertas = cantidadPuertas;
                vehiculo.TipoAutomovil = tipoAuto;
            }
            else if (row["Tipo"].ToString() == "Moto")
            {
                var cilindrada = row["Cilindrada"].ToString();
                vehiculo.Cilindrada = cilindrada;
            }
            else
            {
                throw new NotFoundException("Tipo de vehículo no válido");
            }
            vehiculos.Add(vehiculo);
        }
    }
}
