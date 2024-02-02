using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

        public JsonResult Grafica()
        {

            List<Grafica> lista = CD_Reportes.Instancia.ReporteGrafica();
            return Json(lista, JsonRequestBehavior.AllowGet);
        }



        //[HttpGet]
        //public JsonResult Grafica()
        //{
        //    CD_Reportes Lista = new CD_Reportes();

        //    List<ReporteVenta> objLista = Lista.ReporteGrafica();

        //    return Json(objLista, JsonRequestBehavior.AllowGet);
        //}

    }
}