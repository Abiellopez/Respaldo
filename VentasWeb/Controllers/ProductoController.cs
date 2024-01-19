using CapaDatos;
using CapaModelo;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class ProductoController : Controller
    {
        // GET: Producto
        public ActionResult Crear()
        {
            return View();
        }

        // GET: Producto
        public ActionResult Asignar()
        {
            return View();
        }



        public JsonResult Obtener()
        {
            List<Producto> lista = CD_Producto.Instancia.ObtenerProducto();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerPorTienda(int IdBodega)
        {

            List<Producto> oListaProducto = CD_Producto.Instancia.ObtenerProducto();
            List<ProductoTienda> oListaProductoTienda = CD_ProductoTienda.Instancia.ObtenerProductoTienda();

            oListaProducto = oListaProducto.Where(x => x.Activo == true).ToList();
            if (IdBodega != 0)
            {
                oListaProductoTienda = oListaProductoTienda.Where(x => x.oTienda.IdBodega == IdBodega).ToList();
                oListaProducto = (from producto in oListaProducto
                                  join productotienda in oListaProductoTienda on producto.IdProducto equals productotienda.oProducto.IdProducto
                                  where productotienda.oTienda.IdBodega == IdBodega
                                  select producto).ToList();
            }

            return Json(new { data = oListaProducto }, JsonRequestBehavior.AllowGet);
        }





        [HttpPost]
        public JsonResult Guardar(string objeto,Producto obj, HttpPostedFileBase imagenArchivo)
        {
         
            Response oresponse = new Response() { resultado = false, mensaje = "" };

            try
            {
                Producto oProducto = new Producto();
                oProducto = JsonConvert.DeserializeObject<Producto>(objeto);

                string GuardarEnRuta = ConfigurationManager.AppSettings["ruta_imagenes_libros"];

                oProducto.RutaImagen = GuardarEnRuta;
                oProducto.NombreImagen = "";

                if (!Directory.Exists(GuardarEnRuta))
                    Directory.CreateDirectory(GuardarEnRuta);                   

                if (oProducto.IdProducto == 0)
                {
                    int id = CD_Producto.Instancia.RegistrarProducto(oProducto);
                    oProducto.IdProducto = id;
                    oresponse.resultado = oProducto.IdProducto == 0 ? false : true;

                }
                else
                {
                    oresponse.resultado = CD_Producto.Instancia.ModificarProducto(oProducto);
                }


                if (imagenArchivo != null && oProducto.IdProducto != 0)
                {
                    string extension = Path.GetExtension(imagenArchivo.FileName);
                    GuardarEnRuta = Path.Combine(GuardarEnRuta, oProducto.IdProducto.ToString() + extension);
                    oProducto.NombreImagen = oProducto.IdProducto.ToString() + extension;

                    imagenArchivo.SaveAs(GuardarEnRuta);

                    oresponse.resultado = CD_Producto.Instancia.ActualizarRutaImagen(oProducto);
                }
            }
            catch (Exception e)
            {
                oresponse.resultado = false;
                oresponse.mensaje = e.Message;
            }

            return Json(oresponse, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Producto.Instancia.EliminarProducto(id);

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult RegistrarProductoTienda(ProductoTienda objeto)
        {
            bool respuesta = CD_ProductoTienda.Instancia.RegistrarProductoTienda(objeto);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ModificarProductoTienda(ProductoTienda objeto)
        {
            bool respuesta = CD_ProductoTienda.Instancia.ModificarProductoTienda(objeto);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult EliminarProductoTienda(int id)
        {
            bool respuesta = CD_ProductoTienda.Instancia.EliminarProductoTienda(id);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public JsonResult ObtenerAsignaciones()
        {
            List<ProductoTienda> lista = CD_ProductoTienda.Instancia.ObtenerProductoTienda();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

      
    }
    public class Response
    {

        public bool resultado { get; set; }
        public string mensaje { get; set; }
    }
}