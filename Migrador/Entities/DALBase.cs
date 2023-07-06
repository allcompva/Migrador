using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Migrador.Entities
{
    public class DALBase
    {
        public static SqlConnection getConnection()
        {
            try
            {
                SqlConnection sqlConnection = new SqlConnection();
                return new SqlConnection(
                    ConfigurationManager.ConnectionStrings["DBMain"].ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}