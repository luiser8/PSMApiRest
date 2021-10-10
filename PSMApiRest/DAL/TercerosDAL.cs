using System.Collections;
using System.Data;
using PSMApiRest.Lib;

namespace PSMApiRest.DAL
{
    public class TercerosDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public TercerosDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }
        public bool UpdateIdentificador(string Id_Terceros, string Identificador)
        {
            Parametros.Clear();
            Parametros.Add("@Id_Terceros", Id_Terceros);
            Parametros.Add("@Identificador", Identificador);

            dt = dbCon.Procedure("AMIGO", "TercerosSysUpdate", Parametros);

            return dbCon.ErrorEstatus;
        }
    }
}