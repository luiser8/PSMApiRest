using System;
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
    [RoutePrefix("api/deudas")]
    public class DeudasController : ApiController
    {
        DeudaDAL deudaDAL = new DeudaDAL();

        /// <summary>
        /// Indicamos parametros para obtener deuda
        /// </summary>
        /// <param name="deuda"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // POST: api/deudas/check
        [Route("check")]
        public IHttpActionResult Check([FromBody] Deuda deuda)
        {
            if (deuda.Lapso != null)
            {
                try
                {
                    return Ok(deudaDAL.GetDeuda(deuda.Lapso, /*deuda.Pagada, */deuda.Identificador).ToList());
                }
                catch (Exception ex)
                {
                    return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                }
            }
            return StatusCode(HttpStatusCode.NoContent);
        }
        /// <summary>
        /// Indicamos parametros para obtener deuda
        /// </summary>
        /// <param name="id_cuenta"></param>
        /// <param name="pagada"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // DELETE: api/deudas/delete
        [Route("delete")]
        public IHttpActionResult DeleteDeuda([FromUri] int? id_cuenta, int? pagada)
        {
            if (id_cuenta != null && pagada != null)
            {
                try
                {
                    return Ok(deudaDAL.DeleteDeuda((int)id_cuenta, (int)pagada).ToList());
                }
                catch (Exception ex)
                {
                    return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                }
            }
            return StatusCode(HttpStatusCode.NoContent);
        }
        /// <summary>
        /// Indicamos parametros para obtener deuda
        /// </summary>
        /// <param name="id_cuenta"></param>
        /// <param name="deuda"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // PUT: api/deudas/update
        [Route("update")]
        public IHttpActionResult PutDeuda(int? id_cuenta, Deuda deuda)
        {
            if (id_cuenta != null)
            {
                try
                {
                    return Ok(deudaDAL.EditDeuda((int)id_cuenta, deuda.Pagada, deuda.Monto, deuda.MontoFacturas).ToList());
                }
                catch (Exception ex)
                {
                    return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                }
            }
            return StatusCode(HttpStatusCode.NoContent);
        }
        /// <summary>
        /// Indicamos parametros para obtener deuda
        /// </summary>
        /// <param name="deuda"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // POST: api/deudas/insert
        [Route("insert")]
        public IHttpActionResult InsertDeuda([FromBody] Deuda deuda)
        {
            if (deuda.FechaVencimiento != null)
            {
                try
                {
                    return Ok(deudaDAL.InsertDeuda(deuda.Id_Inscripcion, deuda.Id_Arancel, Calculo.TotalMonto(deuda.MontoFacturas, deuda.Monto /*101712546.56M*/), deuda.FechaVencimiento).ToList());
                }
                catch (Exception ex)
                {
                    return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                }
            }
            return CreatedAtRoute("DefaultApi", new { id = deuda.Id_Inscripcion }, deuda);
        }
    }
}
