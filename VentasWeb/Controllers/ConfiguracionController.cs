using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class ConfiguracionController : Controller
    {
        // GET: Configuracion
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult Obtener()
        {
            List<Configuracion> lista = CD_Configuracion.Instancia.Obtener();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Guardar(Configuracion objeto)
        {
            bool respuesta = false;
            respuesta = CD_Configuracion.Instancia.Modificar(objeto);   
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }







    }
}