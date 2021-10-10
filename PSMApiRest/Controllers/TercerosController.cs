using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PSMApiRest.DAL;

namespace PSMApiRest.Controllers
{
    [Authorize]
    [RoutePrefix("api/terceros")]
    public class TercerosController : ApiController
    {
        TercerosDAL tercerosDAL = new TercerosDAL();
        /// <summary>
        /// </summary>
        /// <param name="Id_Terceros"></param>
        /// <param name="Identificador"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // PUT: api/terceros/update
        [Route("update")]
        public IHttpActionResult PutIdentificador(string Id_Terceros, string Identificador)
        {
            try
            {
                return Ok(tercerosDAL.UpdateIdentificador(Id_Terceros, Identificador));
            }
            catch (Exception ex)
            {
                return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}
