using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class TallaController : Controller
    {
        // GET: Talla
        public ActionResult Crear()
        {
            return View();
        }


        public JsonResult Obtener()
        {
            List<Talla> lista = CD_Talla.Instancia.ObtenerTalla();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Guardar(Talla objeto)
        {
            bool respuesta = false;

            if (objeto.IdTalla == 0)
            {

                respuesta = CD_Talla.Instancia.RegistrarTalla(objeto);
            }
            else
            {
                respuesta = CD_Talla.Instancia.ModificarTalla(objeto);
            }


            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Talla.Instancia.EliminarTalla(id);

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

    }
}