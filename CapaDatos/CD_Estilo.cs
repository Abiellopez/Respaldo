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
    public class CD_Estilo
    {
        public static CD_Estilo _instancia = null;

        private CD_Estilo()
        {

        }

        public static CD_Estilo Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Estilo();
                }
                return _instancia;
            }
        }

        public List<Estilo> ObtenerEstilo()
        {
            List<Estilo> rptListaEstilo = new List<Estilo>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerEstilo", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaEstilo.Add(new Estilo()
                        {
                            CodigoEstilo = Convert.ToInt32(dr["CodigoEstilo"].ToString()),
                            Nombre = dr["Nombre"].ToString(),
                            Activo = Convert.ToBoolean(dr["Activo"].ToString())
                        });
                    }
                    dr.Close();

                    return rptListaEstilo;

                }
                catch (Exception)
                {
                    rptListaEstilo = null;
                    return rptListaEstilo;
                }
            }
        }

        public bool RegistrarEstilo(Estilo oEstilo)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarEstilo", oConexion);
                    cmd.Parameters.AddWithValue("Nombre", oEstilo.Nombre);
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

        public bool ModificarEstilo(Estilo oEstilo)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarEstilo", oConexion);
                    cmd.Parameters.AddWithValue("CodigoEstilo", oEstilo.CodigoEstilo);
                    cmd.Parameters.AddWithValue("Nombre", oEstilo.Nombre);
                    cmd.Parameters.AddWithValue("Activo", oEstilo.Activo);
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

        public bool EliminarEstilo(int CodigoEstilo)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_EliminarEstilo", oConexion);
                    cmd.Parameters.AddWithValue("CodigoEstilo", CodigoEstilo);
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
