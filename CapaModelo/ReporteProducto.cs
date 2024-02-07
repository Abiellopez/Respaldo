using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class ReporteProducto
    {
          public int IdProducto { get; set; }
        public string NombreBodega { get; set; }
        public string CodigoProducto { get; set; }
        public string NombreProducto { get; set; }
        public string DescripcionProducto { get; set; }
        public string NombreCategoria { get; set; }
        public string NombreMarca { get; set; }
        public string NombreEstilo { get; set; }
        public string NombreTalla { get; set; }
        public string NombreColor { get; set; }
        public string StockenTienda { get; set; }
        public string PrecioCompra { get; set; }
        public string PrecioVenta { get; set; }
    }
}
