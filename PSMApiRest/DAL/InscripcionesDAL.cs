using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class InscripcionesDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public InscripcionesDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }
        public List<Inscripciones> GetInscripciones(string Lapso, int Plan1, int Plan2, int Plan3, int Plan4)
        {
            Parametros.Clear();
            Parametros.Add("@Lapso", Lapso);
            Parametros.Add("@Plan1", Plan1);
            Parametros.Add("@Plan2", Plan2);
            Parametros.Add("@Plan3", Plan3);
            Parametros.Add("@Plan4", Plan4);

            List<Inscripciones> InscripcionesList = new List<Inscripciones>();
            dt = dbCon.Procedure("AMIGO", "InscripcionesSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Inscripciones inscripciones = new Inscripciones();
                        inscripciones.Id_Inscripcion = Convert.ToInt32(dt.Rows[i]["Id_Inscripcion"]);
                        InscripcionesList.Add(inscripciones);
                    }
                }
            }
            return InscripcionesList;
        }
        public List<Inscripciones> InsertCuota(int Id_Inscripcion, int Id_Arancel, decimal Monto, DateTime FechaVencimiento)
        {
            Parametros.Clear();
            Parametros.Add("@Id_Inscripcion", Id_Inscripcion);
            Parametros.Add("@Id_Arancel", Id_Arancel);
            Parametros.Add("@Monto", Monto);
            Parametros.Add("@FechaVencimiento", FechaVencimiento);

            List<Inscripciones> InscripcionesList = new List<Inscripciones>();
            dt = dbCon.Procedure("AMIGO", "DeudasSysAllInsert", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Inscripciones inscripciones = new Inscripciones();
                        inscripciones.Id_Inscripcion = Id_Inscripcion;
                        InscripcionesList.Add(inscripciones);
                    }
                }
            }
            return InscripcionesList;
        }
        public List<Inscripciones> InsertCuotaInsertada(int Id_Arancel, string Lapso, decimal Monto, DateTime FechaVencimiento)
        {
            Parametros.Clear();
            Parametros.Add("@Id_Arancel", Id_Arancel);
            Parametros.Add("@Lapso", Lapso);
            Parametros.Add("@Monto", Monto);
            Parametros.Add("@FechaVencimiento", FechaVencimiento);

            List<Inscripciones> InscripcionesList = new List<Inscripciones>();
            dt = dbCon.Procedure("AMIGO", "CuotasInsertadaSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Inscripciones inscripciones = new Inscripciones();
                        inscripciones.Id_Inscripcion = Id_Arancel;
                        InscripcionesList.Add(inscripciones);
                    }
                }
            }
            return InscripcionesList;
        }
    }
}