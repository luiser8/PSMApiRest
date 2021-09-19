using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PSMApiRest.Models
{
    public class TipoIngreso
    {
        public int Id_TipoIngreso { get; set; }
        public string Descripcion { get; set; }
        public byte Activo { get; set; }
    }
}