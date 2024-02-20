using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Tienda
    {
        public static CD_Tienda _instancia = null;

        private CD_Tienda()
        {

        }

        public static CD_Tienda Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Tienda();
                }
                return _instancia;
            }
        }

        public List<Tienda> ObtenerTiendas()
        {
            List<Tienda> rptListaUsuario = new List<Tienda>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerTienda", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaUsuario.Add(new Tienda()
                        {
                            IdBodega = Convert.ToInt32(dr["IdBodega"].ToString()),
                            Nombre = dr["Nombre"].ToString(),
                            Capacidad = Convert.ToInt32(dr["espacio"].ToString()),
                            Activo = Convert.ToBoolean(dr["Activo"].ToString())

                        });
                    }
                    dr.Close();

                    return rptListaUsuario;

                }
                catch (Exception)
                {
                    rptListaUsuario = null;
                    return rptListaUsuario;
                }
            }
        }

        public bool RegistrarTienda(Tienda oTienda)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarTienda", oConexion);
                    cmd.Parameters.AddWithValue("Nombre", oTienda.Nombre);
                    cmd.Parameters.AddWithValue("Capacidad", oTienda.Capacidad);
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


        public bool ModificarTienda(Tienda oTienda)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarTienda", oConexion);
                    cmd.Parameters.AddWithValue("IdBodega", oTienda.IdBodega);
                    cmd.Parameters.AddWithValue("Nombre", oTienda.Nombre);
                    cmd.Parameters.AddWithValue("Capacidad", oTienda.Capacidad);
                    cmd.Parameters.AddWithValue("Activo", oTienda.Activo);
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

        public bool EliminarTienda(int IdBodega)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_EliminarTienda", oConexion);
                    cmd.Parameters.AddWithValue("IdBodega", IdBodega);
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
