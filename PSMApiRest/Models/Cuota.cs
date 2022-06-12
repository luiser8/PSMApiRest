using System;

namespace PSMApiRest.Models
{
    public class Cuota
    {
        public int CuotaId { get; set; }
        public byte Tipo { get; set; }
        public decimal Dolar { get; set; }
        public decimal Tasa { get; set; }
        public decimal Monto { get; set; }
        public string Lapso { get; set; }
        public DateTime FechaCreacion { get; set; }
        public byte Estado { get; set; }
    }
}