using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class MarcaController : Controller
    {
        // GET: Marca
        public ActionResult Crear()
        {
            return View();
        }


        public JsonResult Obtener()
        {
            List<Marca> lista = CD_Marca.Instancia.ObtenerMarca();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Guardar(Marca objeto)
        {
            bool respuesta = false;

            if (objeto.CodigoMarca == 0)
            {

                respuesta = CD_Marca.Instancia.RegistrarMarca(objeto);
            }
            else
            {
                respuesta = CD_Marca.Instancia.ModificarMarca(objeto);
            }


            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Marca.Instancia.EliminarMarca(id);

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

    }
}