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
    public class CD_Devoluciones
    {
        public static CD_Devoluciones _instancia = null;

        private CD_Devoluciones()
        {

        }

        public static CD_Devoluciones Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Devoluciones();
                }
                return _instancia;
            }
        }

        public List<Devoluciones> ReporteDevolucion(DateTime FechaInicio, DateTime FechaFin)
        {
            List<Devoluciones> lista = new List<Devoluciones>();


            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_obtenerDev", oConexion);
                cmd.Parameters.AddWithValue("@FechaInicio", FechaInicio);
                cmd.Parameters.AddWithValue("@FechaFin", FechaFin);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Devoluciones()
                            {
                                FechaDevolucion = dr["FechaDevolucion"].ToString(),
                                Motivo = dr["Motivo"].ToString(),
                                Cantidad = dr["CantidadDevuelta"].ToString(),
                                Codigo = dr["Codigo"].ToString(),
                                Nombre = dr["Nombre"].ToString(),

                            });
                        }

                    }

                }
                catch (Exception)
                {
                    lista = new List<Devoluciones>();
                }
            }

            return lista;

        }


        public bool RegistrarDev(Devoluciones oDev)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                        SqlCommand cmd = new SqlCommand("usp_De", oConexion);                    
                        cmd.Parameters.AddWithValue("Codigo",oDev.Codigo);
                        cmd.Parameters.AddWithValue("Motivo", oDev.Motivo);
                        cmd.Parameters.AddWithValue("Cantidad",oDev.Cantidad);
                        cmd.Parameters.AddWithValue("Co", oDev.Nombre);
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
