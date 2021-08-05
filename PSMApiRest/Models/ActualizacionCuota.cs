using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PSMApiRest.Models
{
    public class ActualizacionCuota
    {
        public decimal Cuota { get; set; }
        public byte Abono { get; set; }
        public string Lapso { get; set; }
        public int Pagada { get; set; }
    }
}