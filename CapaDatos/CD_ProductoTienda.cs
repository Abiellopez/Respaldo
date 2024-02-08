using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_ProductoTienda
    {
        public static CD_ProductoTienda _instancia = null;

        private CD_ProductoTienda()
        {

        }

        public static CD_ProductoTienda Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_ProductoTienda();
                }
                return _instancia;
            }
        }

        public List<ProductoTienda> ObtenerProductoTienda()
        {
            List<ProductoTienda> rptListaProductoTienda = new List<ProductoTienda>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerProductoTienda", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaProductoTienda.Add(new ProductoTienda()
                        {
                            IdProductoBodega = Convert.ToInt32(dr["IdProductoBodega"].ToString()),
                            oProducto = new Producto()
                            {
                                IdProducto = Convert.ToInt32(dr["IdProducto"].ToString()),
                                Codigo = dr["CodigoProducto"].ToString(),
                                Nombre = dr["NombreProducto"].ToString(),
                                Descripcion = dr["DescripcionProducto"].ToString(),
                                RutaImagen = dr["RutaImage"].ToString(),
                                NombreImagen = dr["NombreImage"].ToString(),
                                base64 = Utilidades.convertirBase64(Path.Combine(dr["RutaImage"].ToString(), dr["NombreImage"].ToString())),
                                extension = Path.GetExtension(dr["NombreImage"].ToString()).Replace(".", ""),

                            },

                            oCategoria = new Categoria()
                            {
                                Descripcion = dr["DescripcionCategoria"].ToString()
                            },

                            oMarca = new Marca()
                            {
                                Nombre = dr["DescripcionMarca"].ToString()
                            },

                            oEstilo = new Estilo()
                            {
                                Nombre = dr["NombreEstilo"].ToString()
                            },

                            oTalla = new Talla()
                            {
                                Nombre = dr["DescripcionTalla"].ToString()
                            },

                            oColor = new Color()
                            {
                                Nombre = dr["DescripcionColor"].ToString()
                            },


                            oTienda = new Tienda()
                            {
                                IdBodega = Convert.ToInt32(dr["IdBodega"].ToString()),
                                Nombre = dr["NombreTienda"].ToString(),
                            },
                            PrecioUnidadCompra = Convert.ToDecimal(dr["PrecioUnidadCompra"].ToString()),
                            PrecioUnidadVenta = Convert.ToDecimal(dr["PrecioUnidadVenta"].ToString()),
                            Stock = Convert.ToInt32(dr["Stock"].ToString()),
                            Iniciado = Convert.ToBoolean(dr["Iniciado"].ToString())
                        });
                    }
                    dr.Close();

                    return rptListaProductoTienda;

                }
                catch (Exception)
                {
                    rptListaProductoTienda = null;
                    return rptListaProductoTienda;
                }
            }
        }

        public bool RegistrarProductoTienda(ProductoTienda oProductoTienda)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarProductoTienda", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", oProductoTienda.oProducto.IdProducto);
                    cmd.Parameters.AddWithValue("IdBodega", oProductoTienda.oTienda.IdBodega);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public bool ModificarProductoTienda(ProductoTienda oProductoTienda)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarProductoTienda", oConexion);
                    cmd.Parameters.AddWithValue("IdProductoBodega", oProductoTienda.IdProductoBodega);
                    cmd.Parameters.AddWithValue("IdProducto", oProductoTienda.oProducto.IdProducto);
                    cmd.Parameters.AddWithValue("IdBodega", oProductoTienda.oTienda.IdBodega);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public bool EliminarProductoTienda(int IdProductoBodega)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_EliminarProductoTienda", oConexion);
                    cmd.Parameters.AddWithValue("IdProductoBodega", IdProductoBodega);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public static DataTable ReporteProductoTiend(int IdBodega, string CodigoProducto)
        {
            List<ProductoTienda> lista = new List<ProductoTienda>();
            DataTable dt = new DataTable();

            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlDataAdapter cmd = new SqlDataAdapter("usp_rptProductoTienda", oConexion);
                cmd.SelectCommand.Parameters.AddWithValue("@IdBodega", IdBodega);
                cmd.SelectCommand.Parameters.AddWithValue("@Codigo", CodigoProducto);
                cmd.SelectCommand.CommandType = CommandType.StoredProcedure;

                try
                {    
                    oConexion.Open();
                    cmd.Fill(dt);
                    return dt;

                }
                catch (Exception)
                {
                    lista = new List<ProductoTienda>();
                }
            }

            return dt;
        }






        public bool ControlarStock(int IdProducto, int Cantidad, bool Restar)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ControlarStock", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", IdProducto);
                    cmd.Parameters.AddWithValue("Cantidad", Cantidad);
                    cmd.Parameters.AddWithValue("Restar", Restar);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }
    }
}
