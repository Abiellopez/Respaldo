using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class Producto
    {
        public int IdProducto { get; set; }
        public string Codigo { get; set; }
        public int ValorCodigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string RutaImagen { get; set; }
        public string NombreImagen { get; set; }
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
        public bool Activo { get; set; }
        public string base64 { get; set; }
        public string extension { get; set; }

    }
}
