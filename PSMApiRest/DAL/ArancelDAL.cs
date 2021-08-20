using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class ArancelDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public ArancelDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }
        public List<Arancel> GetArancel(string Lapso)
        {
            Parametros.Clear();
            Parametros.Add("@Lapso", Lapso);

            List<Arancel> ArancelList = new List<Arancel>();
            dt = dbCon.Procedure("AMIGO", "ArancelesSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Arancel arancel = new Arancel();
                        arancel.Id_Arancel = Convert.ToInt32(dt.Rows[i]["Id_Arancel"]);
                        arancel.Descripcion = Convert.ToString(dt.Rows[i]["Descripcion"]);
                        arancel.Detalle = Convert.ToString(dt.Rows[i]["Detalle"]);
                        arancel.FechaVencimiento = Convert.ToDateTime(dt.Rows[i]["FechaVencimiento"]);
                        ArancelList.Add(arancel);
                    }
                }
            }
            return ArancelList;
        }
    }
}