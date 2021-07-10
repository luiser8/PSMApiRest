using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PSMApiRest.Models
{
    public class Lapsos
    {
        public string Lapso { get; set; }
        public byte Activo { get; set; }
        public byte Cerrado { get; set; }
        public string tipo_lapso { get; set; }
    }
}