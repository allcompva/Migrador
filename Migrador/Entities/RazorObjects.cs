using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Migrador.Entities
{
    public class RazorObjects
    {
        public int id { get; set; } 
        public string nombre { get; set; }    
        public string razorType { get; set; }   
        public string package { get; set; } 

        public RazorObjects()
        {
            id = 0;
            nombre = string.Empty;
            razorType = string.Empty;
            package = string.Empty;
        }

        public static List<RazorObjects> read(int ObjectId, string package)
        {
            try
            {
                List<RazorObjects> lstRazorObjects = new List<RazorObjects>();
                using (SqlConnection connection = DALBase.getConnection())
                {
                    SqlCommand command = connection.CreateCommand();
                    command.CommandType = CommandType.Text;
                    command.CommandText =
                        @"SELECT o.[Id] Id, Name, RazorType
                          FROM [Razor] o
                          INNER JOIN RelationObject r
                          ON 1=1
                          AND r.ObjectId = @ObjectId
                          AND r.RelationObjectId = o.Id
                          WHERE RazorType IN ('View', 'Model', 'Store')";
                    command.Parameters.AddWithValue("@ObjectId", ObjectId);
                    command.Connection.Open();
                    SqlDataReader sqlDataReader = command.ExecuteReader();
                    if (sqlDataReader.HasRows)
                    {
                        int id = sqlDataReader.GetOrdinal("id");
                        int name = sqlDataReader.GetOrdinal("name");
                        int RazorType = sqlDataReader.GetOrdinal("RazorType");

                        while (sqlDataReader.Read())
                        {
                            RazorObjects obj = new RazorObjects();
                            obj.id = sqlDataReader.GetInt32(id);
                            if (!sqlDataReader.IsDBNull(name))
                                obj.nombre = sqlDataReader.GetString(name);
                            if (!sqlDataReader.IsDBNull(RazorType))
                                obj.razorType = sqlDataReader.GetString(RazorType);
                            obj.package = package;
                            lstRazorObjects.Add(obj);
                        }
                    }
                }
                return lstRazorObjects;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}