﻿using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Reportes
    {
        public static CD_Reportes _instancia = null;

        private CD_Reportes()
        {

        }

        public static CD_Reportes Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Reportes();
                }
                return _instancia;
            }
        }

        public List<ReporteProducto> ReporteProductoTienda(int IdBodega, string CodigoProducto)
        {
            List<ReporteProducto> lista = new List<ReporteProducto>();

            NumberFormatInfo formato = new CultureInfo("es-PE").NumberFormat;
            formato.CurrencyGroupSeparator = ".";

            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_rptProductoTienda", oConexion);
                cmd.Parameters.AddWithValue("@IdBodega", IdBodega);
                cmd.Parameters.AddWithValue("@Codigo", CodigoProducto);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    
                    using (SqlDataReader dr = cmd.ExecuteReader()) {
                        while (dr.Read()) {
                            lista.Add(new ReporteProducto()
                            {
                                NombreBodega = dr["Nombre Tienda"].ToString(),
                                CodigoProducto = dr["Codigo Producto"].ToString(),
                                NombreProducto = dr["Nombre Producto"].ToString(),
                                DescripcionProducto = dr["Descripcion Producto"].ToString(),
                                NombreCategoria = dr["DescripcionCategoria"].ToString(),
                                NombreMarca = dr["DescripcionMarca"].ToString(),
                                NombreEstilo = dr["NombreEstilo"].ToString(),
                                NombreTalla = dr["DescripcionTalla"].ToString(),
                                NombreColor = dr["DescripcionColor"].ToString(),
                                StockenTienda = dr["Stock en tienda"].ToString(),
                                PrecioCompra = Convert.ToDecimal(dr["Precio Compra"].ToString()).ToString("N", formato),
                                PrecioVenta = Convert.ToDecimal(dr["Precio Venta"].ToString()).ToString("N", formato)
                            });
                        }

                    }

                }
                catch (Exception)
                {
                    lista = new List<ReporteProducto>();
                }
            }

            return lista;
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












        public List<ReporteVenta> ReporteVenta(DateTime FechaInicio, DateTime FechaFin)
        {
            List<ReporteVenta> lista = new List<ReporteVenta>();

            NumberFormatInfo formato = new CultureInfo("es-PE").NumberFormat;
            formato.CurrencyGroupSeparator = ".";

            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_rptVenta", oConexion);
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
                            lista.Add(new ReporteVenta()
                            {
                                FechaVenta = dr["Fecha Venta"].ToString(),
                                NumeroDocumento = dr["Numero Documento"].ToString(),
                                TipoDocumento = dr["Tipo Documento"].ToString(),
                                NombreEmpleado = dr["Nombre Empleado"].ToString(),
                                CantidadUnidadesVendidas = dr["Cantidad Unidades Vendidas"].ToString(),
                                CantidadProductos = dr["Cantidad Productos"].ToString(),
                                TotalVenta = Convert.ToDecimal(dr["Total Venta"].ToString(), new CultureInfo("es-PE")).ToString("N", formato)
                            });
                        }

                    }

                }
                catch (Exception)
                {
                    lista = new List<ReporteVenta>();
                }
            }

            return lista;

        }
    }
}