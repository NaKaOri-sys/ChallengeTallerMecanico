using System.Data;
using System.Data.SqlClient;

namespace ChallengeTallerMecanico.DataAccess
{
    public class BaseDataAccess
    {
        private static BaseDataAccess _instance = null;
        private static string _connectionString;

        private BaseDataAccess()
        {

        }

        public static void Configure(string connectionString)
        {
            _connectionString = connectionString;
        }

        public static BaseDataAccess Instance
        {
            get
            {
                _instance ??= new BaseDataAccess();
                return _instance;
            }
        }
        public DataTable ExecuteQuery(string query)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                {
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    return dataTable;
                }
            }
        }

        public int ExecuteNonQuery(string query)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    return command.ExecuteNonQuery();
                }
            }
        }
    }
}