using CapaDatos;
using CapaModelo;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class HomeController : Controller
    {
        private static Usuario SesionUsuario;
        public ActionResult Index()
        {
            if (Session["Usuario"] != null)
                SesionUsuario = (Usuario)Session["Usuario"];
            else {
                SesionUsuario = new Usuario();
            }
            try
            {
                ViewBag.NombreUsuario = SesionUsuario.Nombres + " " + SesionUsuario.Apellidos;
                ViewBag.RolUsuario = SesionUsuario.oRol.Descripcion;

            }
            catch {

            }

           
            return View();
        }

        public ActionResult Salir()
        {
            Session["Usuario"] = null;
            return RedirectToAction("Index", "Login");
        }
        public JsonResult resumen()
        {

            List<RetornarVentas> Lista = CD_Reportes.Instancia.Retornar();        
            return Json(Lista, JsonRequestBehavior.AllowGet);

        }
 
        //public JsonResult Grafica()
        //{
          
        //    List<Grafica> lista = CD_Reportes.Instancia.ReporteGrafica();
        //    return Json(lista, JsonRequestBehavior.AllowGet);
        //}
        public JsonResult GraficaPastel()
        {

            List<GraficaPastel> lista = CD_Reportes.Instancia.ReporteGraficaPastel();
            return Json(lista, JsonRequestBehavior.AllowGet);
        }

    }
}