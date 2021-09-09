using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class RolesDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public RolesDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }
        public List<Roles> GetRoles()
        {
            Parametros.Clear();

            List<Roles> RolesList = new List<Roles>();
            dt = dbCon.Procedure("AMIGO", "RolesAllSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Roles roles = new Roles();
                        roles.RolId = Convert.ToInt32(dt.Rows[i]["RolId"]);
                        roles.Rol = Convert.ToInt32(dt.Rows[i]["Rol"]);
                        roles.Nombre = Convert.ToString(dt.Rows[i]["Nombre"]);
                        roles.Bloqueado = Convert.ToByte(dt.Rows[i]["Bloqueado"]);
                        roles.FechaCreacion = Convert.ToDateTime(dt.Rows[i]["FechaCreacion"]);
                        roles.Estado = Convert.ToByte(dt.Rows[i]["Estado"]);
                        RolesList.Add(roles);
                    }
                }
            }
            return RolesList;
        }
    }
}