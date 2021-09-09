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
                        users.Rol = Convert.ToInt32(dt.Rows[i]["Rol"]);
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
        public List<Users> GetUsuarios()
        {
            Parametros.Clear();

            List<Users> UsersList = new List<Users>();
            dt = dbCon.Procedure("AMIGO", "UsuariosAllSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Users users = new Users();
                        users.Cedula = Convert.ToInt32(dt.Rows[i]["Cedula"]);
                        users.UsuarioId = Convert.ToInt32(dt.Rows[i]["UsuarioId"]);
                        users.RolId = Convert.ToInt32(dt.Rows[i]["RolId"]);
                        users.Rol = Convert.ToInt32(dt.Rows[i]["Rol"]);
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
        public List<Users> CreateUsuarios(Users user)
        {
            Parametros.Clear();
            Parametros.Add("@RolId", user.RolId);
            Parametros.Add("@Usuario", user.Usuario);
            Parametros.Add("@Cedula", user.Cedula);
            Parametros.Add("@Nombres", user.Nombres);
            Parametros.Add("@Apellidos", user.Apellidos);
            Parametros.Add("@Contrasena", MD5.GetMD5(user.Contrasena));

            List<Users> UsersList = new List<Users>();
            dt = dbCon.Procedure("AMIGO", "UsuariosAddSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Users users = new Users();
                        users.UsuarioId = Convert.ToInt32(dt.Rows[i]["UsuarioId"]);
                        UsersList.Add(users);
                    }
                }
            }
            return UsersList;
        }
        public List<Users> UpdateUsuarios(Users user)
        {
            Parametros.Clear();
            Parametros.Add("@UsuarioId", user.UsuarioId);
            Parametros.Add("@Usuario", user.Usuario);
            Parametros.Add("@Cedula", user.Cedula);
            Parametros.Add("@Nombres", user.Nombres);
            Parametros.Add("@Apellidos", user.Apellidos);

            List<Users> UsersList = new List<Users>();
            dt = dbCon.Procedure("AMIGO", "UsuariosEditSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Users users = new Users();
                        users.UsuarioId = Convert.ToInt32(dt.Rows[i]["UsuarioId"]);
                        UsersList.Add(users);
                    }
                }
            }
            return UsersList;
        }
        public List<Users> DelUsuarios(int UsuarioId)
        {
            Parametros.Clear();
            Parametros.Add("@UsuarioId", UsuarioId);

            List<Users> UsersList = new List<Users>();
            dt = dbCon.Procedure("AMIGO", "UsuariosDelSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Users users = new Users();
                        users.UsuarioId = Convert.ToInt32(dt.Rows[i]["UsuarioId"]);
                        UsersList.Add(users);
                    }
                }
            }
            return UsersList;
        }
    }
}