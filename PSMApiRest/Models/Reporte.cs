using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PSMApiRest.Models
{
    public class Reporte
    {
        public string Lapso { get; set; }
        public string Fullnombre { get; set; }
        public string Identificador { get; set; }
        public string Descripcion { get; set; }
        public string Cuota { get; set; }
        public decimal Monto { get; set; }
        public decimal MontoFacturas { get; set; }
        public decimal Total { get; set; }
    }
}