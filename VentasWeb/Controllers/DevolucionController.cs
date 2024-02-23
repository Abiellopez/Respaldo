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
    public class DevolucionController : Controller
    {
        // GET: Devolucion
        public ActionResult Devoluciones()
        {
            return View();
        }

        public JsonResult ObtenerDev(string fechainicio, string fechafin)
        {

            List<Devoluciones> lista = CD_Devoluciones.Instancia.ReporteDevolucion(Convert.ToDateTime(fechainicio), Convert.ToDateTime(fechafin));
            return Json(lista, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RegistrarDev(Devoluciones objeto)
        {
            bool respuesta = CD_Devoluciones.Instancia.RegistrarDev(objeto);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }




    }
}