using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Migrador.Entities
{
    public class UiAplication
    {
        public int id { get; set; }
        public string name { get; set; }
        public static List<UiAplication> read()
        {
            try
            {
                List<UiAplication> UiAplicationList = new List<UiAplication>();
                using (SqlConnection connection = DALBase.getConnection())
                {
                    SqlCommand command = connection.CreateCommand();
                    command.CommandType = CommandType.Text;
                    command.CommandText = 
                        @"SELECT B.Id, B.Name 
                          FROM _Sistema.dbo.UsersDesktopModules A
                          INNER JOIN UIApplication B ON A.udm_key_reference 
                          COLLATE Modern_Spanish_CI_AS =B.Name
                          WHERE udm_disponible = 1
                          ORDER BY B.Name";

                    command.Connection.Open();
                    SqlDataReader sqlDataReader = command.ExecuteReader();
                    if (sqlDataReader.HasRows)
                    {
                        int id = sqlDataReader.GetOrdinal("id");
                        int name = sqlDataReader.GetOrdinal("name");
                        UiAplication obj = new UiAplication();
                        obj.id = 0;
                        obj.name = "-Seleccione Aplicacion-";
                        UiAplicationList.Add(obj);
                        while (sqlDataReader.Read())
                        {
                            obj = new UiAplication();
                            obj.id = sqlDataReader.GetInt32(id);
                            if (!sqlDataReader.IsDBNull(name))
                                obj.name = sqlDataReader.GetString(name);

                            UiAplicationList.Add(obj);
                        }
                    }
                }
                return UiAplicationList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}