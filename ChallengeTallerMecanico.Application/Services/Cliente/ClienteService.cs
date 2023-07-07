using ChallengeTallerMecanico.Application.Dto;
using ChallengeTallerMecanico.DataAccess;
using EjercicioPOO.Application.Exceptions;
using System.Data;

namespace ChallengeTallerMecanico.Application.Services.Cliente
{
    public class ClienteService : IClienteService
    {
        private readonly BaseDataAccess _dataAccess;

        public ClienteService()
        {
            _dataAccess = BaseDataAccess.Instance;
        }

        public void CreateCliente(ClienteRequestDto cliente)
        {
            try
            {
                var dtCliente = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..Cliente WHERE Nombre = '{cliente.Nombre}' AND Apellido = '{cliente.Apellido}'");
                if (dtCliente.Rows.Count > 0)
                    throw new BadRequestException("El cliente ya existe.");

                _dataAccess.ExecuteNonQuery($"EXEC [ChallengeTallerMecanico]..CreateCliente '{cliente.Nombre}', '{cliente.Apellido}', '{cliente.Email}'");
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }
        public void DeleteCliente(int Id)
        {
            try
            {
                _dataAccess.ExecuteNonQuery($"DELETE FROM [ChallengeTallerMecanico]..Cliente WHERE Id = {Id}");
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public ClienteDto GetCliente(int Id)
        {
            try
            {
                var dtCliente = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..Cliente WHERE Id = {Id}");
                if (dtCliente.Rows.Count == 0)
                    throw new BadRequestException("El cliente indicado no existe.");

                var dataRow = dtCliente.Rows[0];
                var cliente = new ClienteDto
                {
                    Id = Id,
                    Nombre = dataRow["Nombre"].ToString(),
                    Apellido = dataRow["Apellido"].ToString(),
                    Email = dataRow["Email"].ToString()
                };

                return cliente;
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public List<ClienteDto> GetAll()
        {
            try
            {
                var dtCliente = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..Cliente");
                if (dtCliente.Rows.Count == 0)
                    throw new BadRequestException("No existen clientes guardados.");
                var clientes = new List<ClienteDto>();
                foreach (DataRow item in dtCliente.Rows)
                {
                    var cliente = new ClienteDto
                    {
                        Id = int.Parse(item["Id"].ToString()),
                        Nombre = item["Nombre"].ToString(),
                        Apellido = item["Apellido"].ToString(),
                        Email = item["Email"].ToString()
                    };
                    clientes.Add(cliente);
                }

                return clientes;
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        public void UpdateCliente(ClienteDto cliente)
        {
            try
            {
                var dtCliente = _dataAccess.ExecuteQuery($"SELECT * FROM [ChallengeTallerMecanico]..Cliente WHERE Id = {cliente.Id}");
                if (dtCliente.Rows.Count == 0)
                    throw new BadRequestException("El cliente no existe.");

                var updateFields = GenerateUpdateFields(cliente);

                var updateQuery = $"UPDATE [ChallengeTallerMecanico]..Cliente SET {" " + string.Join(", ", updateFields)} WHERE Id = {cliente.Id}"; ;

                if (updateFields.Count > 0)
                {
                    _dataAccess.ExecuteNonQuery(updateQuery);
                }
            }
            catch (Exception ex)
            {
                throw new InternalErrorException(ex.Message);
            }
        }

        private List<string> GenerateUpdateFields(ClienteDto cliente)
        {
            var updateFields = new List<string>();
            if (!string.IsNullOrEmpty(cliente.Nombre))
            {
                updateFields.Add($"Nombre = '{cliente.Nombre}'");
            }

            if (!string.IsNullOrEmpty(cliente.Apellido))
            {
                updateFields.Add($"Apellido = '{cliente.Apellido}'");
            }

            if (!string.IsNullOrEmpty(cliente.Email))
            {
                updateFields.Add($"Email = '{cliente.Email}'");
            }

            return updateFields;
        }
    }
}
