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
    public class CD_Grafica
    {
        public List<Grafica> RetornarVentas()
        {
            List<Grafica> objLista = new List<Grafica>();

            //Data Source=;Initial Catalog= ; User ID= ; Password=
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("SP_RetornarVentas", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                try {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        objLista.Add(new Grafica()
                        {
                            mes = dr["mes"].ToString(),
                            cantidad = int.Parse(dr["cantidad"].ToString()),
                        });
                    }
                    dr.Close();

                    return objLista;

                }
                catch (Exception)
                {
                    objLista = null;
                    return objLista;
                }
        }
      }
    }
  }
