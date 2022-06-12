using System;

namespace PSMApiRest.Models
{
    public class Arancel
    {
        public int Id_Arancel { get; set; }
        public string Descripcion { get; set; }
        public string Detalle { get; set; }
        public DateTime FechaVencimiento { get; set; }
    }
}