using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class PlanesDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public PlanesDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }
        public List<Planes> GetPlanes(string Lapso, byte Tipo)
        {
            Parametros.Clear();
            Parametros.Add("@Lapso", Lapso);
            Parametros.Add("@Tipo", Tipo);

            List<Planes> PlanesList = new List<Planes>();
            dt = dbCon.Procedure("AMIGO", "PlanesPagosSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Planes planes = new Planes();
                        planes.Id_Periodo = Convert.ToInt32(dt.Rows[i]["Id_Periodo"]);
                        planes.Id_Plan = Convert.ToInt32(dt.Rows[i]["Id_Plan"]);
                        planes.Descripcion = Convert.ToString(dt.Rows[i]["Descripcion"]);
                        PlanesList.Add(planes);
                    }
                }
            }
            return PlanesList;
        }
    }
}