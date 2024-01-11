using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class ProductoTienda
    {
        public int IdProductoBodega { get; set; }
        public Producto oProducto { get; set; }
        public Tienda oTienda { get; set; }
        public int IdCategoria { get; set; }
        public Categoria oCategoria { get; set; }
        public int CodigoMarca { get; set; }
        public Marca oMarca { get; set; }
        public int CodigoEstilo { get; set; }
        public Estilo oEstilo { get; set; }
        public int IdTalla { get; set; }
        public Talla oTalla { get; set; }
        public int IdColor { get; set; }
        public Color oColor { get; set; }
        public int Stock { get; set; }
        public decimal PrecioUnidadCompra { get; set; }
        public decimal PrecioUnidadVenta { get; set; }
        public bool Iniciado { get; set; }
    }
}
