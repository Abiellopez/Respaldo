using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class Devoluciones
    {
        public string FechaDevolucion { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Motivo { get; set; }
        public string Cantidad { get; set; }
    }
}


//USE[Tienda_Lucia]
//GO
///****** Object:  StoredProcedure [dbo].[usp_De]    Script Date: 21/02/2024 23:31:03 ******/
//SET ANSI_NULLS ON
//GO
//SET QUOTED_IDENTIFIER ON
//GO
//ALTER PROC [dbo].[usp_De] (
//@Codigo int,
//@Motivo varchar(500),
//@Cantidad int
//)
//as
//BEGIN


//    DECLARE @IdVenta int;

//select @IdVenta = IdVenta from VENTA where Codigo = @Codigo;

//if @IdVenta is not null


//    begin
//    begin transaction;
//insert into Devoluciones(IdVenta, Motivo, CantidadDevuelta)
//	values(@IdVenta, @Motivo, @Cantidad)

//    --insert into PRODUCTO_BODEGA(Stock)
//	--values(@Cantidad)


//    update Venta set 
//	Activo = 0
//	where IdVenta = @IdVenta;

//commit;
//end



//    else
//    begin
//    print 'No se encontro el numero de factura';
//end



//end;