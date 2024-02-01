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

            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("SP_RetornarVentas", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                    while (dr.Read())
                    {
                        objLista.Add(new Grafica()
                        {
                            mes = dr["mes"].ToString(),
                            cantidad = int.Parse(dr["CantidadTotal"].ToString()),
                        });
                      }
                  }
       
        }
            return objLista;
        }


    }
}
