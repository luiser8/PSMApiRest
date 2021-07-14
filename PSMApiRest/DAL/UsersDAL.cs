using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class UsersDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public UsersDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }

        public List<Users> Login(string Usuario, string Contrasena)
        {
            Parametros.Clear();
            Parametros.Add("@Usuario", Usuario);
            Parametros.Add("@Contrasena", Contrasena);

            List<Users> UsersList = new List<Users>();
            dt = dbCon.Procedure("AMIGO", "UsuariosSysLogin", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Users users = new Users();
                        users.Cedula = Convert.ToInt32(dt.Rows[i]["Cedula"]);
                        users.UsuarioId = Convert.ToInt32(dt.Rows[i]["UsuarioId"]);
                        users.Nombres = Convert.ToString(dt.Rows[i]["Nombres"]);
                        users.Apellidos = Convert.ToString(dt.Rows[i]["Apellidos"]);
                        users.Usuario = Convert.ToString(dt.Rows[i]["Usuario"]);
                        users.Bloqueado = Convert.ToByte(dt.Rows[i]["Bloqueado"]);
                        users.FechaCreacion = Convert.ToDateTime(dt.Rows[i]["FechaCreacion"]);
                        users.Estado = Convert.ToByte(dt.Rows[i]["Estado"]);
                        UsersList.Add(users);
                    }
                }
            }
            return UsersList;
        }
    }
}