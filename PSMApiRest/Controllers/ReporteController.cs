using System;
using System.Net.Http;
using System.Web.Http;
using PSMApiRest.DAL;
using System.Net;
using System.Data;
using ClosedXML.Excel;
using System.IO;
using System.Net.Http.Headers;

namespace PSMApiRest.Controllers
{
    [Authorize]
    [RoutePrefix("api/reporte")]
    public class ReporteController : ApiController
    {
        ReporteDAL reporteDAL = new ReporteDAL();

        /// <summary>
        /// Indicamos parametros para obtener reporte de deudas
        /// </summary>
        /// <param name="Lapso"></param>
        /// <returns> 
        ///     Retorna un objeto JSON
        /// </returns>
        /// <response code="200">Retorno del registro</response>
        /// <response code="400">Retorno de null si no hay registros</response> 
        // POST: api/reporte/create
        [HttpGet]
        [Route("get")]
        public HttpResponseMessage GetReporte([FromUri] string Lapso, byte Pagada)
        {
            DataTable dt = new DataTable("Cuentas");
            dt.Columns.AddRange(new DataColumn[9] { new DataColumn("Lapso", typeof(string)),
                                            new DataColumn("Identificador", typeof(Int32)),
                                            new DataColumn("FullNombres", typeof(string)),
                                            new DataColumn("Telefonos", typeof(string)),
                                            new DataColumn("Descripcion", typeof(string)),
                                            new DataColumn("Cuota", typeof(string)),
                                            new DataColumn("Monto", typeof(decimal)),
                                            new DataColumn("MontoFacturas", typeof(decimal)),
                                            new DataColumn("Total", typeof(decimal))
            });

            foreach (var reporte in reporteDAL.GetReporte(Lapso, Pagada))
            {
                dt.Rows.Add(reporte.Lapso, reporte.Identificador, reporte.Fullnombre, reporte.Telefonos, reporte.Descripcion, reporte.Cuota, reporte.Monto, reporte.MontoFacturas, reporte.Total);
            }

            using (XLWorkbook wb = new XLWorkbook())
            {

                using (MemoryStream stream = new MemoryStream())
                {
                    var wwb = wb.Worksheets.Add(dt);
                    wwb.Columns().AdjustToContents();
                    wb.SaveAs(stream);
                    
                    HttpResponseMessage result = new HttpResponseMessage(HttpStatusCode.OK);
                    result.Content = new ByteArrayContent(stream.GetBuffer());
                    result.Content.Headers.ContentLength = stream.Length;
                    result.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment")
                    {
                        FileName = "reporte" + "_" + DateTime.Now.ToShortDateString() + ".xlsx"
                    };
                    result.Content.Headers.ContentType = new MediaTypeHeaderValue("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                    return result;
                }
            }
        }
    }
}
