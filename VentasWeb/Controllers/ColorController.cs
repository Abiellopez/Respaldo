using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class ColorController : Controller
    {
        // GET: Color
        public ActionResult Crear()
        {
            return View();
        }


        public JsonResult Obtener()
        {
            List<Color> lista = CD_Color.Instancia.ObtenerColor();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Guardar(Color objeto)
        {
            bool respuesta = false;

            if (objeto.IdColor == 0)
            {

                respuesta = CD_Color.Instancia.RegistrarColor(objeto);
            }
            else
            {
                respuesta = CD_Color.Instancia.ModificarColor(objeto);
            }


            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Color.Instancia.EliminarColor(id);

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

    }
}