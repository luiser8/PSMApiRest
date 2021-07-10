using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PSMApiRest.Models
{
    public class Cuota
    {
        public int CuotaId { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaCreacion { get; set; }
        public byte Estado { get; set; }
    }
}