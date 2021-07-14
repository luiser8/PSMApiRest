using System;

namespace PSMApiRest.Models
{
    public class Users
    {
        public int UsuarioId { get; set; }
        public int Cedula { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Usuario { get; set; }
        public string Contrasena { get; set; }
        public byte Bloqueado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public byte Estado { get; set; }
    }
}