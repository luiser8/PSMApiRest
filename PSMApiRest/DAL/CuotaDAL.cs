using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class CuotaDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public CuotaDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }

        public List<Cuota> GetCuota()
        {
            Parametros.Clear();
            //Parametros.Add("@Lapso", Lapso);

            List<Cuota> CuotaList = new List<Cuota>();
            dt = dbCon.Procedure("AMIGO", "CuotasSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Cuota cuota = new Cuota();
                        cuota.CuotaId = Convert.ToInt32(dt.Rows[i]["CuotaId"]);
                        cuota.Monto = Convert.ToDecimal(dt.Rows[i]["Monto"]);
                        cuota.FechaCreacion = Convert.ToDateTime(dt.Rows[i]["FechaCreacion"]);
                        cuota.Estado = Convert.ToByte(dt.Rows[i]["Estado"]);
                        CuotaList.Add(cuota);
                    }
                }
            }
            return CuotaList;
        }

        public List<Cuota> InsertCuota(decimal Monto)
        {
            Parametros.Clear();
            Parametros.Add("@Monto", Monto);

            List<Cuota> CuotaList = new List<Cuota>();
            dt = dbCon.Procedure("AMIGO", "CuotasSysInsert", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Cuota cuota = new Cuota();
                        cuota.Monto = Monto;
                        CuotaList.Add(cuota);
                    }
                }
            }
            return CuotaList;
        }
        public List<Cuota> EditCuota(int CuotaId, decimal Monto, byte Estado)
        {
            Parametros.Clear();
            Parametros.Add("@CuotaId", CuotaId);
            Parametros.Add("@Monto", Monto);
            Parametros.Add("@Estado", Estado);

            List<Cuota> CuotaList = new List<Cuota>();
            dt = dbCon.Procedure("AMIGO", "CuotasSysUpdate", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Cuota cuota = new Cuota();
                        cuota.CuotaId = CuotaId;
                        CuotaList.Add(cuota);
                    }
                }
            }
            return CuotaList;
        }
        public List<Cuota> DeleteCuota(int CuotaId)
        {
            Parametros.Clear();
            Parametros.Add("@CuotaId", CuotaId);

            List<Cuota> CuotaList = new List<Cuota>();
            dt = dbCon.Procedure("AMIGO", "CuotasSysDelete", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Cuota cuota = new Cuota();
                        cuota.CuotaId = CuotaId;
                        CuotaList.Add(cuota);
                    }
                }
            }
            return CuotaList;
        }
    }
}