using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace Migrador.Entities
{
    public class Controllers
    {
        public int Id { get; set; }
        public string nombre { get; set; }
        public string package { get; set; }
        public List<RazorObjects> lstViews { get; set; }
        public List<RazorObjects> lstModels { get; set; }
        public List<RazorObjects> lstStores { get; set; }

        public Controllers()
        {
            Id = 0;
            nombre = string.Empty;
            package = string.Empty;
            lstViews = new List<RazorObjects>();
            lstModels = new List<RazorObjects>();
            lstStores = new List<RazorObjects>();
        }
        public static List<Controllers> read(int ObjectId,
            DirectoryInfo diCommon, DirectoryInfo diCuenta, 
            DirectoryInfo diTablas)
        {
            try
            {
                List<Controllers> lstControllers = new List<Controllers>();
                using (SqlConnection connection = DALBase.getConnection())
                {
                    SqlCommand command = connection.CreateCommand();
                    command.CommandType = CommandType.Text;
                    command.CommandText =
                        @"SELECT o.[Id] Id, Name 
                          FROM [Razor] o
	                          INNER JOIN RelationObject r ON 1=1
	                          AND r.ObjectTypeId = 51
	                          AND r.ObjectId = @ObjectId
	                          AND r.RelationObjectTypeId = 50
	                          AND r.RelationObjectId = o.Id
                          WHERE RazorType = 'Controller'";
                    command.Parameters.AddWithValue("@ObjectId", ObjectId);
                    command.Connection.Open();
                    SqlDataReader sqlDataReader = command.ExecuteReader();
                    if (sqlDataReader.HasRows)
                    {
                        int id = sqlDataReader.GetOrdinal("id");
                        int name = sqlDataReader.GetOrdinal("name");

                        while (sqlDataReader.Read())
                        {
                            Controllers obj = new Controllers();
                            if (!sqlDataReader.IsDBNull(id))
                                obj.Id = sqlDataReader.GetInt32(id);
                            if (!sqlDataReader.IsDBNull(name))
                                obj.nombre = sqlDataReader.GetString(name);

                            foreach (var fi in diCommon.GetFiles())
                            {
                                string nameSe = Path.GetFileNameWithoutExtension(fi.Name);
                                if(obj.nombre.Contains(nameSe))
                                    obj.package = "common";
                            }
                            foreach (var fi in diCuenta.GetFiles())
                            {
                                string nameSe = Path.GetFileNameWithoutExtension(fi.Name);
                                if (obj.nombre.Contains(nameSe))
                                    obj.package = "cuenta";
                            }
                            foreach (var fi in diTablas.GetFiles())
                            {
                                string nameSe = Path.GetFileNameWithoutExtension(fi.Name);
                                if (obj.nombre.Contains(nameSe))
                                    obj.package = "tablas";
                            }
                            List<RazorObjects> objects = RazorObjects.read(obj.Id,
                                obj.package);
                            obj.lstViews.AddRange(objects.FindAll(
                                v => v.nombre.Contains("View")));
                            obj.lstModels.AddRange(objects.FindAll(
                                v => v.nombre.Contains("Model")));
                            obj.lstStores.AddRange(objects.FindAll(
                                v => v.nombre.Contains("Store")));
                            lstControllers.Add(obj);
                        }
                    }
                }
                return lstControllers;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}