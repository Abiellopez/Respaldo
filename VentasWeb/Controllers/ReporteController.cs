using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace VentasWeb.Controllers
{
    public class ReporteController : Controller
    {
        // GET: Reporte
        public ActionResult Producto()
        {
            return View();
        }

        // GET: Reporte
        public ActionResult Ventas()
        {
            return View();
        }

        public JsonResult ObtenerProducto(int idBodega, string codigoproducto)
        {
            List<ReporteProducto> lista = CD_Reportes.Instancia.ReporteProductoTienda(idBodega, codigoproducto);
            return Json(lista, JsonRequestBehavior.AllowGet);
        }


        public JsonResult ObtenerVenta(string fechainicio, string fechafin)
        {
            
            List<ReporteVenta> lista = CD_Reportes.Instancia.ReporteVenta(Convert.ToDateTime(fechainicio), Convert.ToDateTime(fechafin));
            return Json(lista, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Guardar(ReporteProducto objeto)
        {
            bool respuesta = false;
            respuesta = CD_Reportes.Instancia.ModificarPrecioVenta(objeto);     
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        //[HttpGet]
        //public JsonResult ConsultaReporte(int idBodega, string codigoproducto)
        //{

        //    DataTable dt = new DataTable();

        //    dt = CD_ProductoTienda.ReporteProductoTiend(idBodega, codigoproducto);

        //    return Json(new { data = DataTableToJSONWithJavaScriptSerializer(dt) }, JsonRequestBehavior.AllowGet);

        //}

        //public string DataTableToJSONWithJavaScriptSerializer(DataTable table)
        //{
        //    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        //    List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        //    Dictionary<string, object> childRow;
        //    foreach (DataRow row in table.Rows)
        //    {
        //        childRow = new Dictionary<string, object>();
        //        foreach (DataColumn col in table.Columns)
        //        {
        //            childRow.Add(col.ColumnName, row[col]);
        //        }
        //        parentRow.Add(childRow);
        //    }
        //    return jsSerializer.Serialize(parentRow);
        //}


    }
}