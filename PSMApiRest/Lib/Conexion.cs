using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PSMApiRest.Lib
{
    public class Conexion
    {
        public static SqlConnection con;
        public static SqlConnection HashTableConnection(string db)
        {
            string constring = ConfigurationManager.ConnectionStrings[db].ToString();
            return con = new SqlConnection(constring);
        }
    }
}