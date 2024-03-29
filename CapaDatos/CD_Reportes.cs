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

        public CD_Reportes()
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



        //public bool ModificarPrecioVenta(ReporteProducto oPromo)
        //{
        //    bool respuesta = true;
        //    using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
        //    {
        //        try
        //        {
        //            SqlCommand cmd = new SqlCommand("usp_ModificarPrecio", oConexion);
        //            cmd.Parameters.AddWithValue("IdProduct", oPromo.IdProducto);
        //            cmd.Parameters.AddWithValue("Precio", oPromo.PrecioVenta);
        //            cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

        //            cmd.CommandType = CommandType.StoredProcedure;

        //            oConexion.Open();

        //            cmd.ExecuteNonQuery();

        //            respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

        //        }
        //        catch (Exception)
        //        {
        //            respuesta = false;
        //        }

        //    }

        //    return respuesta;

        //}





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

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new ReporteProducto()
                            {
                                IdProducto = Convert.ToInt32(dr["Id"].ToString()),
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
                                PrecioVenta = Convert.ToDecimal(dr["PrecioVenta"].ToString()).ToString("N", formato)
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


        //public List<ReporteProducto> ReporteProductoTiend(int IdBodega, string CodigoProducto)
        //{
        //    List<ReporteProducto> lista = new List<ReporteProducto>();

        //    NumberFormatInfo formato = new CultureInfo("es-PE").NumberFormat;
        //    formato.CurrencyGroupSeparator = ".";

        //    using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
        //    {
        //        SqlCommand cmd = new SqlCommand("usp_rptProductoTienda", oConexion);
        //        cmd.Parameters.AddWithValue("@IdBodega", IdBodega);
        //        cmd.Parameters.AddWithValue("@Codigo", CodigoProducto);
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        try
        //        {
        //            oConexion.Open();

        //            using (SqlDataReader dr = cmd.ExecuteReader())
        //            {
        //                while (dr.Read())
        //                {
        //                    lista.Add(new ReporteProducto()
        //                    {
        //                        IdProducto = Convert.ToInt32(dr["Id"].ToString()),
        //                        NombreBodega = dr["Nombre Tienda"].ToString(),
        //                        CodigoProducto = dr["Codigo Producto"].ToString(),
        //                        NombreProducto = dr["Nombre Producto"].ToString(),
        //                        DescripcionProducto = dr["Descripcion Producto"].ToString(),
        //                        NombreCategoria = dr["DescripcionCategoria"].ToString(),
        //                        NombreMarca = dr["DescripcionMarca"].ToString(),
        //                        NombreEstilo = dr["NombreEstilo"].ToString(),
        //                        NombreTalla = dr["DescripcionTalla"].ToString(),
        //                        NombreColor = dr["DescripcionColor"].ToString(),
        //                        StockenTienda = dr["Stock en tienda"].ToString(),
        //                        PrecioCompra = Convert.ToDecimal(dr["Precio Compra"].ToString()).ToString("N", formato),
        //                        PrecioVenta = Convert.ToDecimal(dr["Precio Venta"].ToString()).ToString("N", formato)
        //                    });
        //                }

        //            }

        //        }
        //        catch (Exception)
        //        {
        //            lista = new List<ReporteProducto>();
        //        }
        //    }

        //    return lista;
        //}






        //public static DataTable ReporteProductoTienda(int IdBodega, string CodigoProducto)
        //{
        //    List<ReporteProducto> rptListaAl = new List<ReporteProducto>();
        //    DataTable dt = new DataTable();
        //    using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
        //    {
        //        SqlDataAdapter da = new SqlDataAdapter("usp_ReporteAlumno", oConexion);
        //        da.SelectCommand.Parameters.AddWithValue("Nombres", Nombres);
        //        da.SelectCommand.Parameters.AddWithValue("Apellidos", Apellidos);
        //        da.SelectCommand.Parameters.AddWithValue("Codigo", Codigo);
        //        da.SelectCommand.Parameters.AddWithValue("DocumentoIdentidad", DocumentoIdentidad);
        //        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        //        try
        //        {
        //            oConexion.Open();
        //            da.Fill(dt);
        //            return dt;
        //        }
        //        catch (Exception ex)
        //        {
        //            return dt;
        //        }
        //    }
        //}









        public List<ReporteVenta> ReporteVenta(DateTime FechaInicio, DateTime FechaFin)
        {
            List<ReporteVenta> lista = new List<ReporteVenta>();

            
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
                                TotalVenta = dr["Total Venta"].ToString()
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

        public List<RetornarVentas> Retornar()
        {
            List<RetornarVentas> lista = new List<RetornarVentas>();


            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("SP_RetornarVentas", oConexion);

                cmd.CommandType = CommandType.StoredProcedure;
          

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new RetornarVentas()
                            {
                             
                            Fecha = dr["Dia"].ToString(),
                         
                                Cantidad = dr["CantidadTotal"].ToString(),
                      
                            });
                        }

                    }

                }
                catch (Exception)
                {
                    lista = new List<RetornarVentas>();
                }
            }

            return lista;

        }

        public List<Grafica> ReporteGrafica()
        {
            List<Grafica> lista = new List<Grafica>();


            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_grafica", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Grafica()
                            {
                                FechaVenta = dr["Fecha"].ToString(),
                                FechaMes = dr["Fecha mes"].ToString(),
                                CantidadProductos = dr["CantidaTotal"].ToString(),

                            });
                        }

                    }

                }
                catch (Exception)
                {
                    lista = new List<Grafica>();
                }
            }

            return lista;

        }

        //public List<Bcapacidad> Capacidad()
        //{
        //    List<Bcapacidad> lista = new List<Bcapacidad>();
        //    using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
        //    {
        //        SqlCommand cmd = new SqlCommand("usp_CantidadBodegas", oConexion);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        try
        //        {
        //            oConexion.Open();
        //            using (SqlDataReader dr = cmd.ExecuteReader())
        //            {
        //                while (dr.Read())
        //                {
        //                    lista.Add(new Bcapacidad()
        //                    {
        //                        Bodega = dr["Bodega"].ToString(),
        //                        Capacidad = dr["Capacidad"].ToString(),
        //                        Total = dr["Total"].ToString(),
        //                    });
        //                }
        //            }
        //        }
        //        catch(Exception)
        //        {
        //            lista = new List<Bcapacidad>();
        //        }
        //    }
        //    return lista;

        //}


        public List<Bcapacidad> Capacidad()
        {
            List<Bcapacidad> lista = new List<Bcapacidad>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_CantidadBodegas", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        lista.Add(new Bcapacidad()
                        {
                            Bodega = dr["Bodega"].ToString(),
                            Capacidad = Convert.ToInt32(dr["Capacidad"].ToString()),
                            Total = Convert.ToInt32(dr["Total"].ToString()),

                        });
                    }
                    dr.Close();

                    return lista;

                }
                catch (Exception)
                {
                    lista = null;
                    return lista;
                }
            }
        }


        public List<GraficaPastel> ReporteGraficaPastel()
        {
            List<GraficaPastel> lista = new List<GraficaPastel>();


            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("SP_RetornarProductos", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new GraficaPastel()
                            {
                                producto = dr["producto"].ToString(),
                                cantidad = dr["cantidad"].ToString(),
                               

                            });
                        }

                    }

                }
                catch (Exception)
                {
                    lista = new List<GraficaPastel>();
                }
            }

            return lista;

        }






    }
}