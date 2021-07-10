﻿using System;
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
    [RoutePrefix("api/cuotas")]
    public class CuotasController : ApiController
    {
        CuotaDAL cuotaDAL = new CuotaDAL();

        /// <summary>
        /// </summary>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // GET: api/cuotas/all
        [Route("all")]
        public IHttpActionResult GetCuota()
        {
            try
            {
                return Ok(cuotaDAL.GetCuota());
            }
            catch (Exception ex)
            {
                return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
        /// <summary>
        /// Indicamos parametros para obtener deuda
        /// </summary>
        /// <param name="cuota"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // POST: api/cuotas/insert
        [Route("insert")]
        public IHttpActionResult InsertCuota([FromBody] Cuota cuota)
        {
            if (cuota.Monto != null)
            {
                try
                {
                    return Ok(cuotaDAL.InsertCuota(cuota.Monto).ToList());
                }
                catch (Exception ex)
                {
                    return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                }
            }
            return CreatedAtRoute("DefaultApi", new { id = cuota.CuotaId }, cuota);
        }

        /// <summary>
        /// Indicamos parametros para obtener deuda
        /// </summary>
        /// <param name="cuotaId"></param>
        /// <param name="cuota"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // PUT: api/cuotas/update
        [Route("update")]
        public IHttpActionResult PutCuota(int? cuotaId, Cuota cuota)
        {
            if (cuotaId != null)
            {
                try
                {
                    return Ok(cuotaDAL.EditCuota((int)cuotaId, cuota.Monto, cuota.Estado).ToList());
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
        /// <param name="cuotaId"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // DELETE: api/cuotas/delete
        [Route("delete")]
        public IHttpActionResult DeleteCuota([FromUri] int? cuotaId)
        {
            if (cuotaId != null)
            {
                try
                {
                    return Ok(cuotaDAL.DeleteCuota((int)cuotaId).ToList());
                }
                catch (Exception ex)
                {
                    return (IHttpActionResult)Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                }
            }
            return StatusCode(HttpStatusCode.NoContent);
        }
    }
}