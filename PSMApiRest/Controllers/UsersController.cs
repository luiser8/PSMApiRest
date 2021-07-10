using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using PSMApiRest.DAL;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.Controllers
{
    [Authorize]
    [RoutePrefix("api/users")]
    public class UsersController : ApiController
    {
        UsersDAL usersDAL = new UsersDAL();
        /// <summary>
        /// Establecemos inicio de sesion, verificando usuario y contrasena
        /// </summary>
        /// <param name="users"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // POST: api/users/login
        [Route("login")]
        public IHttpActionResult Login([FromBody] Users users)
        {
            if (users.Usuario != null && users.Contrasena != null)
            {
                try
                {
                    string ContrasenaMD5 = MD5.GetMD5(users.Contrasena);
                    var result = usersDAL.Login(users.Usuario, ContrasenaMD5).ToList();

                    /*if (result.Count == 0)
                    {
                        return Ok(result.Count);
                    }*/
                    return Ok(result);
                }
                catch (Exception ex)
                {
                    return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                }
            }
            return Ok();
        }
    }
}
