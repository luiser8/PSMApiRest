﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PSMApiRest.Lib
{
    public class Calculo
    {
        public static decimal TotalMonto(decimal MontoFacturas, decimal Cuota)
        {
            string decMath = Math.Abs(MontoFacturas).ToString();
            decimal dec = Convert.ToDecimal(decMath);
            decimal total = Cuota - dec;
            decimal totalToSave = total - (total % 0.01M);
            return totalToSave;
        }
    }
}