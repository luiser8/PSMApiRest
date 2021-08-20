using System;

namespace PSMApiRest.Models
{
    public class Inscripciones
    {
        public string Lapso { get; set; }
        public int Plan1 { get; set; }
        public int Plan2 { get; set; }
        public int Plan3 { get; set; }
        public int Plan4 { get; set; }
        public int Id_Inscripcion { get; set; }
        public int Id_Arancel { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaVencimiento { get; set; }
    }
}