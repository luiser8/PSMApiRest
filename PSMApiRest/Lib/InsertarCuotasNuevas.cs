using PSMApiRest.DAL;
using System;
using System.Collections.Generic;

namespace PSMApiRest.Models
{
    public class InsertarCuotasNuevas
    {
        public List<Inscripciones> Establecer(string Lapso, int Plan1, int Plan2, int Plan3, int Plan4, int Id_Arancel, decimal Monto, DateTime FechaVencimiento)
        {
            InscripcionesDAL inscripcionesDAL = new InscripcionesDAL();
            FacturaDAL facturaDAL = new FacturaDAL();
            DeudaDAL deudaDAL = new DeudaDAL();
            List<Inscripciones> inscripciones = inscripcionesDAL.GetInscripciones(Lapso, Plan1, Plan2, Plan3, Plan4);

            if (inscripciones.Count > 0)
            {
                for (int i = 0; i < inscripciones.Count; i++)
                {
                    if (
                        facturaDAL.GetFacturaExists(inscripciones[i].Id_Inscripcion, Id_Arancel).Count == 0 
                        && 
                        deudaDAL.GetDeudasExists(inscripciones[i].Id_Inscripcion, Id_Arancel).Count == 0)
                    {
                        inscripcionesDAL.InsertCuota(inscripciones[i].Id_Inscripcion, Id_Arancel, Monto, FechaVencimiento);
                    }
                }
            }
            return inscripciones;
        }
        public List<Inscripciones> EstablecerSAIA(string Lapso, int Plan1, int Plan2, int Id_Arancel, decimal Monto, DateTime FechaVencimiento)
        {
            InscripcionesDAL inscripcionesDAL = new InscripcionesDAL();
            FacturaDAL facturaDAL = new FacturaDAL();
            DeudaDAL deudaDAL = new DeudaDAL();
            List<Inscripciones> inscripciones = inscripcionesDAL.GetInscripcionesSAIA(Lapso, Plan1, Plan2);

            if (inscripciones.Count > 0)
            {
                for (int i = 0; i < inscripciones.Count; i++)
                {
                    if (
                        facturaDAL.GetFacturaExists(inscripciones[i].Id_Inscripcion, Id_Arancel).Count == 0
                        &&
                        deudaDAL.GetDeudasExists(inscripciones[i].Id_Inscripcion, Id_Arancel).Count == 0)
                    {
                        inscripcionesDAL.InsertCuota(inscripciones[i].Id_Inscripcion, Id_Arancel, Monto, FechaVencimiento);
                    }
                }
            }
            return inscripciones;
        }
    }
}