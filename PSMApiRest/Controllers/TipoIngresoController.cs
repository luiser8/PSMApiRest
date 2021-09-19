using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PSMApiRest.DAL;
using PSMApiRest.Lib;
using PSMApiRest.Models;

namespace PSMApiRest.Controllers
{
    [Authorize]
    [RoutePrefix("api/tipoingreso")]
    public class TipoIngresoController : ApiController
    {
        TipoIngresoDAL tipoIngresoDAL = new TipoIngresoDAL();
        /// <summary>
        /// </summary>
        /// <param name="Lapso"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // GET: api/tipoingreso/get
        [Route("get")]
        public IHttpActionResult GetTipoIngreso(string Lapso)
        {
            try
            {
                return Ok(tipoIngresoDAL.GetTiposDeIngreso(Lapso).ToArray());
            }
            catch (Exception ex)
            {
                return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}
