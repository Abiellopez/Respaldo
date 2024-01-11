using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class EstiloController : Controller
    {
        // GET: Estilo
        public ActionResult Crear()
        {
            return View();
        }


        public JsonResult Obtener()
        {
            List<Estilo> lista = CD_Estilo.Instancia.ObtenerEstilo();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Guardar(Estilo objeto)
        {
            bool respuesta = false;

            if (objeto.CodigoEstilo == 0)
            {

                respuesta = CD_Estilo.Instancia.RegistrarEstilo(objeto);
            }
            else
            {
                respuesta = CD_Estilo.Instancia.ModificarEstilo(objeto);
            }


            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Estilo.Instancia.EliminarEstilo(id);

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

    }
}