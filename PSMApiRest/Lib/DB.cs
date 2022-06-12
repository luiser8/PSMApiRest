using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace PSMApiRest.Lib
{
    public class DB
    {
        SqlConnection conn = new SqlConnection();
        public bool ErrorEstatus { get; private set; }
        public string ErrorMsg { get; private set; }

        public DataTable Procedure(string db, string nombre, Hashtable parametros)
        {
            conn = Conexion.HashTableConnection(db);

            DataTable resp = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(nombre, conn);

            da.SelectCommand.CommandTimeout = 180;
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            IDictionaryEnumerator el = null;
            el = parametros.GetEnumerator();

            while (el.MoveNext())
            {
                if (el.Value == null)
                {
                    da.SelectCommand.Parameters.AddWithValue(el.Key.ToString(), DBNull.Value);
                }
                else
                {
                    da.SelectCommand.Parameters.AddWithValue(el.Key.ToString(), el.Value);
                }
            }

            try
            {
                da.Fill(resp);
                ErrorEstatus = true;
                ErrorMsg = "";
            }
            catch (SqlException ex)
            {
                ErrorEstatus = false;
                ErrorMsg = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            return resp;
        }
    }
}