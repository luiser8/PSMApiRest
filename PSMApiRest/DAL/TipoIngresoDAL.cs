using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class TipoIngresoDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public TipoIngresoDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }
        public List<TipoIngreso> GetTiposDeIngreso(string Lapso)
        {
            Parametros.Clear();
            Parametros.Add("@Lapso", Lapso);

            List<TipoIngreso> tipoIngresosList = new List<TipoIngreso>();
            dt = dbCon.Procedure("AMIGO", "TiposDeIngresoSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        TipoIngreso tipoIngreso = new TipoIngreso();
                        tipoIngreso.Id_TipoIngreso = Convert.ToInt32(dt.Rows[i]["Id_TipoIngreso"]);
                        tipoIngreso.Descripcion = Convert.ToString(dt.Rows[i]["Descripcion"]);
                        tipoIngreso.Activo = Convert.ToByte(dt.Rows[i]["Activo"]);
                        tipoIngresosList.Add(tipoIngreso);
                    }
                }
            }
            return tipoIngresosList;
        }
    }
}