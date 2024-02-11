using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Configuracion
    {


        public static CD_Configuracion _instancia = null;

        private CD_Configuracion()
        {

        }

        public static CD_Configuracion Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Configuracion();
                }
                return _instancia;
            }
        }

        public List<Configuracion> Obtener()
        {
            List<Configuracion> rptLista = new List<Configuracion>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerConfiguracion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptLista.Add(new Configuracion()
                        {
                            IdConfiguracion = Convert.ToInt32(dr["IdTienda"].ToString()),
                            RUC = dr["RUC"].ToString(),
                            NombreLocal = dr["NombreLocal"].ToString(),
                            NombrePropietaria = dr["NombrePropietaria"].ToString(),
                            Direccion = dr["Direccion"].ToString(),
                            Telefono = Convert.ToInt32(dr["Telefono"].ToString()),
                            Correo = dr["Correo"].ToString(), 
                            Linea = Convert.ToInt32(dr["Lineafija"].ToString()),
                            Fiscal = dr["NombreFiscal"].ToString(),
                            Descripcion = dr["Descripcion"].ToString()
                        });
                    }
                    dr.Close();

                    return rptLista;

                }
                catch (Exception)
                {
                    rptLista = null;
                    return rptLista;
                }
            }
        }


        public bool Modificar(Configuracion oConfig)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarConfiguracion", oConexion);
                    cmd.Parameters.AddWithValue("IdTienda", oConfig.IdConfiguracion);
                    cmd.Parameters.AddWithValue("Ruc", oConfig.RUC);
                    cmd.Parameters.AddWithValue("NombreLocal", oConfig.NombreLocal);
                    cmd.Parameters.AddWithValue("Nombre", oConfig.NombrePropietaria);
                    cmd.Parameters.AddWithValue("Direccion", oConfig.Direccion);
                    cmd.Parameters.AddWithValue("Telefono", oConfig.Telefono);
                    cmd.Parameters.AddWithValue("Correo", oConfig.Correo);
                    cmd.Parameters.AddWithValue("Linea", oConfig.Linea);
                    cmd.Parameters.AddWithValue("Fiscal", oConfig.Fiscal);
                    cmd.Parameters.AddWithValue("Descripcion", oConfig.Descripcion);
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
