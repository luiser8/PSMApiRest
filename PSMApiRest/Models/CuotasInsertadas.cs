﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PSMApiRest.Models
{
    public class CuotasInsertadas
    {
        public int Id_Arancel { get; set; }
        public string Descripcion { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaVencimiento { get; set; }
    }
}