using System;

namespace PSMApiRest.Models
{
    public class Deuda
    {
        public int Id_Cuenta { get; set; }
        public int Id_Inscripcion { get; set; }
        public int Id_Arancel { get; set; }
        public byte Pagada { get; set; }
        public string Lapso { get; set; }
        public string Identificador { get; set; }
        public string Fullnombre { get; set; }
        public string Descripcion { get; set; }
        public string Cuota { get; set; }
        public decimal Monto { get; set; }
        public decimal MontoFacturas { get; set; }
        public decimal Total { get; set; }
        public DateTime FechaVencimiento { get; set; }
    }
}