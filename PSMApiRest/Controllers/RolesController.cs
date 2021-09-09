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
    [RoutePrefix("api/roles")]
    public class RolesController : ApiController
    {
        RolesDAL rolesDAL = new RolesDAL();
        /// <summary>
        /// Obtenemos lista de Roles
        /// </summary>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // GET: api/roles/get
        [Route("get")]
        public IHttpActionResult GetRoles()
        {
            try
            {
                return Ok(rolesDAL.GetRoles().ToList());
            }
            catch (Exception ex)
            {
                return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}
