using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.DAL
{
    public class AlumnoDAL
    {
        private readonly DB dbCon;
        private DataTable dt;
        private readonly Hashtable Parametros;

        public AlumnoDAL()
        {
            dt = new DataTable();
            dbCon = new DB();
            Parametros = new Hashtable();
        }
        public List<Alumno> GetAlumno(string Cedula)
        {
            Parametros.Clear();
            Parametros.Add("@Cedula", Cedula);
            List<Alumno> AlumnoList = new List<Alumno>();
            dt = dbCon.Procedure("PRD", "AlumnosSys", Parametros);

            if (dbCon.ErrorEstatus)
            {
                if (dt.Rows.Count != 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Alumno alumno = new Alumno();
                        alumno.IdAl = Convert.ToInt32(dt.Rows[i]["IdAl"]);
                        alumno.Cedula = Convert.ToString(dt.Rows[i]["Cedula"]);
                        alumno.Fullnombre = Convert.ToString(dt.Rows[i]["Fullnombre"]);
                        alumno.Foto = (Byte[])dt.Rows[i]["Foto"];
                        alumno.Sexo = Convert.ToByte(dt.Rows[i]["Sexo"]);
                        alumno.LapCur = Convert.ToString(dt.Rows[i]["LapCur"]);
                        alumno.EstAca = Convert.ToString(dt.Rows[i]["EstAca"]);
                        alumno.codcarrera = Convert.ToInt32(dt.Rows[i]["codcarrera"]);
                        AlumnoList.Add(alumno);
                    }
                }
            }
            return AlumnoList;
        }
    }
}