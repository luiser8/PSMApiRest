using System;

namespace PSMApiRest.Models
{
    public class Roles
    {
        public int RolId { get; set; }
        public int Rol { get; set; }
        public string Nombre { get; set; }
        public byte Bloqueado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public byte Estado { get; set; }
    }
}