using CapaModelo;
using System;
using Utilidad;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Threading.Tasks;


namespace CapaDatos
{
    public class CD_Producto
    {
        public static CD_Producto _instancia = null;

        private CD_Producto()
        {

        }

        public static CD_Producto Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Producto();
                }
                return _instancia;
            }
        }

        public List<Producto> ObtenerProducto()
        {
            List<Producto> rptListaProducto = new List<Producto>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerProductos", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaProducto.Add(new Producto()
                        {
                            IdProducto = Convert.ToInt32(dr["IdProducto"].ToString()),
                            Codigo = dr["Codigo"].ToString(),
                            ValorCodigo = Convert.ToInt32(dr["ValorCodigo"].ToString()),
                            Nombre = dr["Nombre"].ToString(),
                            Descripcion = dr["DescripcionProducto"].ToString(),                         
                            IdCategoria = Convert.ToInt32(dr["IdCategoria"].ToString()),
                            oCategoria = new Categoria() { Descripcion = dr["DescripcionCategoria"].ToString() },
                            CodigoMarca = Convert.ToInt32(dr["CodigoMarca"].ToString()),
                            oMarca = new Marca() { Nombre = dr["DescripcionMarca"].ToString() },
                            CodigoEstilo = Convert.ToInt32(dr["CodigoEstilo"].ToString()),
                            oEstilo = new Estilo() { Nombre = dr["NombreEstilo"].ToString() },
                            IdTalla = Convert.ToInt32(dr["IdTalla"].ToString()),
                            oTalla = new Talla() { Nombre = dr["DescripcionTalla"].ToString() },
                            IdColor = Convert.ToInt32(dr["IdColor"].ToString()),
                            oColor = new Color() { Nombre = dr["DescripcionColor"].ToString() },
                            RutaImagen = dr["RutaImagen"].ToString(),
                            NombreImagen = dr["NombreImagen"].ToString(),
                            base64 = Utilidades.convertirBase64(Path.Combine(dr["RutaImagen"].ToString(), dr["NombreImagen"].ToString())),
                            extension = Path.GetExtension(dr["NombreImagen"].ToString()).Replace(".", ""),


                            Activo = Convert.ToBoolean(dr["Activo"].ToString())
                        });
                    }
                    dr.Close();

                    return rptListaProducto;

                }
                catch (Exception)
                {
                    rptListaProducto = null;
                    return rptListaProducto;
                }
            }
        }

        public int RegistrarProducto(Producto oProducto)
        {
            int respuesta = 0;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarProducto", oConexion);
                    cmd.Parameters.AddWithValue("Nombre", oProducto.Nombre);
                    cmd.Parameters.AddWithValue("Descripcion", oProducto.Descripcion);
                    cmd.Parameters.AddWithValue("ruta", oProducto.RutaImagen);
                    cmd.Parameters.AddWithValue("imagen", oProducto.NombreImagen);
                    cmd.Parameters.AddWithValue("IdCategoria", oProducto.IdCategoria);
                    cmd.Parameters.AddWithValue("IdMarca", oProducto.CodigoMarca);
                    cmd.Parameters.AddWithValue("IdEstilo", oProducto.CodigoEstilo);
                    cmd.Parameters.AddWithValue("IdTalla", oProducto.IdTalla);
                    cmd.Parameters.AddWithValue("IdColor", oProducto.IdColor);
                
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToInt32(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = 0;
                }
            }
            return respuesta;
        }

        public bool ModificarProducto(Producto oProducto)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarProducto", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", oProducto.IdProducto);
                    cmd.Parameters.AddWithValue("Nombre", oProducto.Nombre);
                    cmd.Parameters.AddWithValue("Descripcion", oProducto.Descripcion);
                    cmd.Parameters.AddWithValue("IdCategoria", oProducto.IdCategoria);
                    cmd.Parameters.AddWithValue("IdMarca", oProducto.CodigoMarca);
                    cmd.Parameters.AddWithValue("IdEstilo", oProducto.CodigoEstilo);
                    cmd.Parameters.AddWithValue("IdTalla", oProducto.IdTalla);
                    cmd.Parameters.AddWithValue("IdColor", oProducto.IdColor);
                    cmd.Parameters.AddWithValue("Activo", oProducto.Activo);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }


        public bool ActualizarRutaImagen(Producto objeto)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_actualizarRutaImagen", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", objeto.IdProducto);
                    cmd.Parameters.AddWithValue("NombreImagen", objeto.NombreImagen);
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }







        public bool EliminarProducto(int IdProducto)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_EliminarProducto", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", IdProducto);
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
