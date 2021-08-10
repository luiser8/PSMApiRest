using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class ReporteDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public ReporteDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }
        public List<Reporte> GetReporte(string Lapso, int Pagada)
        {
            Parametros.Clear();
            Parametros.Add("@Lapso", Lapso);
            Parametros.Add("@Pagada", Pagada);
            Parametros.Add("@Identificador", null);

            List<Reporte> reporteList = new List<Reporte>();
            dt = dbCon.Procedure("AMIGO", "DeudasSysNegativos", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Reporte reporte = new Reporte();
                        reporte.Lapso = Convert.ToString(dt.Rows[i]["Lapso"]);
                        reporte.Fullnombre = Convert.ToString(dt.Rows[i]["Fullnombre"]);
                        reporte.Identificador = Convert.ToString(dt.Rows[i]["Identificador"]);
                        reporte.Descripcion = Convert.ToString(dt.Rows[i]["Descripcion"]);
                        reporte.Cuota = Convert.ToString(dt.Rows[i]["Cuota"]);
                        reporte.Monto = Convert.ToDecimal(dt.Rows[i]["Monto"]);
                        reporte.MontoFacturas = Convert.ToDecimal(dt.Rows[i]["MontoFacturas"]);
                        reporte.Total = Math.Floor(Convert.ToDecimal(dt.Rows[i]["Total"]) * 100) / 100;
                        reporteList.Add(reporte);
                    }
                }
            }
            return reporteList;
        }
    }
}