



$(document).ready(function () {
  

})


var tabladata;
$(document).ready(function () {
    activarMenu("Reportes");

    //OBTENER TIENDAS
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerTiendas,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $("#cboTienda").LoadingOverlay("hide");
            $("#cboTienda").html("");

            $("<option>").attr({ "value": 0 }).text("-- Seleccionar todas--").appendTo("#cboTienda");
            if (data.data != null)
                $.each(data.data, function (i, item) {

                    if (item.Activo == true) {
                        $("<option>").attr({ "value": item.IdBodega }).text(item.Nombre).appendTo("#cboTienda");
                    }
                })
        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
            $("#cboTienda").LoadingOverlay("show");
        },
    });


    $('#tbdata').DataTable({
        responsive: true,
        "scrollY": "300px",
        "scrollCollapse": true,
        "scrollX": true,
        "paging": false,
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        }
    })

})

function Buscar() {
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerReporteProducto + "?idBodega=" + $("#cboTienda").val() + "&codigoproducto=" + $("#txtCodigoProducto").val(),
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data != null) {


                if ($.fn.DataTable.isDataTable('#tbdata')) {
                    $('#tbdata').DataTable().destroy();
                }


                $('#tbdata').DataTable({
                    responsive: true,
                    data: json,
                        "columns": [

            { "data": "NombreBodega" },
            { "data": "CodigoProducto" },
            { "data": "NombreProducto" },
            { "data": "DescripcionProducto" },
            { "data": "NombreCategoria" },
            { "data": "NombreMarca" },
            { "data": "NombreEstilo" },
            { "data": "NombreTalla" },
            { "data": "NombreColor" },
            { "data": "StockenTienda" },
            { "data": "PrecioCompra" },
            { "data": "PrecioVenta" },
            {
                "data": "IdProducto", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary  btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            }


        ],
                    "scrollY": "300px",
                    "scrollCollapse": true,
                    "scrollX": true,
                    "paging": false,
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            title: 'Reporte_' + ObtenerFecha()
                        },
                        {
                            extend: 'print'
                        }
                    ],
                    "language": {
                        "url": $.MisUrls.url.Url_datatable_spanish
                    }
                });



            } else {
                swal("Mensaje", "No se pudo eliminar el curso", "warning")
            }
        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {

        },
    });

}

//$('#btnBuscar').on('click', function () {

//    jQuery.ajax({
//        url: $.MisUrls.url._ObtenerReporteProducto + "?idBodega=" + $("#cboTienda").val() + "&codigoproducto=" + $("#txtCodigoProducto").val(),
//        type: "GET",
//        dataType: "json",
//        contentType: "application/json; charset=utf-8",
//        success: function (data) {

//            if (data != undefined && data != null) {

//                $("#tbReporte tbody").html("");
//                console.log(data)

//                $.each(data, function (i, row) {

//                    $("<tr>").append(
//                        $("<td>").text(row["NombreBodega"]),
//                        $("<td>").text(row["CodigoProducto"]),
//                        $("<td>").text(row["NombreProducto"]),
//                        $("<td>").text(row["DescripcionProducto"]),
//                        $("<td>").text(row["NombreCategoria"]),
//                        $("<td>").text(row["NombreMarca"]),
//                        $("<td>").text(row["NombreEstilo"]),
//                        $("<td>").text(row["NombreTalla"]),
//                        $("<td>").text(row["NombreColor"]),
//                        $("<td>").text(row["StockenTienda"]),
//                        $("<td>").text(row["PrecioCompra"]),
//                        $("<td>").text(row["PrecioVenta"]),
//                        $("<tr>").append(
//                        $("<button><i class='fas fa-pen'></i></button>").addClass("btn btn-primary btn-sm").on('click', 'button[class="btn btn-primary btn-sm"]', function (row) {
//                        abrirPopUpForm(" + JSON.stringify(row)+ ") }),      

//                    ).appendTo("#tbReporte tbody");
//                })

//            }
//        },
//        error: function (error) {
//            console.log(error)
//        },
//        beforeSend: function () {
//        },
//    });

//})







function abrirPopUpForm(json) {
    $("#txtid").val(json.IdProducto);
    $("#txtPrecioVenta").val(json.PrecioVenta);
    $('#FormModal').modal('show');

}

function Guardar() {


        var request = {
            objeto: {
                IdProducto: parseInt($("#txtid").val()),
                PrecioVenta: parseInt($("#txtPrecioVenta").val()),
            }
        }

        jQuery.ajax({
            url: $.MisUrls.url._GuardarRebaja,
            type: "POST",
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                if (data.resultado) {
                    tabladata.ajax.reload();
                    $('#FormModal').modal('hide');
                } else {

                    swal("Mensaje", "No se pudo guardar los cambios", "warning")
                }
            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {

            },
        });

    }











function printData() {

    if ($('#tbReporte tbody tr').length == 0) {
        swal("Mensaje", "No existen datos para imprimir", "warning")
        return;
    }

    var divToPrint = document.getElementById("tbReporte");

    var style = "<style>";
    style = style + "table {width: 100%;font: 17px Calibri;}";
    style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
    style = style + "padding: 2px 3px;text-align: center;}";
    style = style + "</style>";

    newWin = window.open("");


    newWin.document.write(style);
    newWin.document.write("<h3>Reporte de productos por Bodega</h3>");
    newWin.document.write(divToPrint.outerHTML);
    newWin.print();
    newWin.close();
}



















//$(document).ready(function () {
//    activarMenu("Reportes");
   
//    tabladata = $('#tbReporte').DataTable({
//        "ajax": {
//            "url": $.MisUrls.url._ObtenerReporteProducto,
//            "type": "GET",
//            "datatype": "json"
         
//        },

       
//        "columns": [
          
//            { "data": "NombreBodega" },
//            { "data": "CodigoProducto" },
//            { "data": "NombreProducto" },
//            { "data": "DescripcionProducto" },
//            { "data": "NombreCategoria" },
//            { "data": "NombreMarca" },
//            { "data": "NombreEstilo" },
//            { "data": "NombreTalla" },
//            { "data": "NombreColor" },
//            { "data": "StockenTienda" },
//            { "data": "PrecioCompra" },
//            { "data": "PrecioVenta" },
//            {
//                "data": "IdProducto", "render": function (data, type, row, meta) {
//                    return "<button class='btn btn-primary  btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>"
//                },
//                "orderable": false,
//                "searchable": false,
//                "width": "90px"
//            }

         
//        ],
//        "language": {
//            "url": $.MisUrls.url.Url_datatable_spanish
//        },
     
//        responsive: true
//    });
//    console.log(data)
//})



////$('#btnBuscar').on('click', function () {
////    jQuery.ajax({
////        url: $.MisUrls.url._ObtenerReporteProducto + "?idBodega=" + $("#cboTienda").val() + "&codigoproducto=" + $("#txtCodigoProducto").val(),
        
////        type: "GET",
////        dataType: "json",
////        contentType: "application/json; charset=utf-8",
////        success: function (data) {

////            if (data != undefined && data != null) {
           

////                $("#tbReporte tbody").html("");


////                $.each(data, function (i, row) {
////                    console.log(data)
////                    $("<tr>").append(
////                        $("<td>").text(row["NombreBodega"]),
////                        $("<td>").text(row["CodigoProducto"]),
////                        $("<td>").text(row["NombreProducto"]),
////                        $("<td>").text(row["DescripcionProducto"]),
////                        $("<td>").text(row["NombreCategoria"]),
////                        $("<td>").text(row["NombreMarca"]),
////                        $("<td>").text(row["NombreEstilo"]),
////                        $("<td>").text(row["NombreTalla"]),
////                        $("<td>").text(row["NombreColor"]),
////                        $("<td>").text(row["StockenTienda"]),
////                        $("<td>").text(row["PrecioCompra"]),
////                        $("<td>").text(row["PrecioVenta"]),
////                        $("<td>").append(
////                            $("<button><i class='fas fa-pen'></i></button>").addClass("btn btn-primary btn-sm")
////                                .data("idproducto", parseInt($("IdProducto").val()))
////                        ),




////                    ).appendTo("#tbReporte tbody");
////                })
////            }
////        },
////        error: function (error) {
////            console.log(error)
////        },
////        beforeSend: function () {
////        },
////    });

////})






////function printData() {

////    if ($('#tbReporte tbody tr').length == 0) {
////        swal("Mensaje", "No existen datos para imprimir", "warning")
////        return;
////    }

////    var divToPrint = document.getElementById("tbReporte");

////    var style = "<style>";
////    style = style + "table {width: 100%;font: 17px Calibri;}";
////    style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
////    style = style + "padding: 2px 3px;text-align: center;}";
////    style = style + "</style>";

////    newWin = window.open("");


////    newWin.document.write(style);
////    newWin.document.write("<h3>Reporte de productos por Bodega</h3>");
////    newWin.document.write(divToPrint.outerHTML);
////    newWin.print();
////    newWin.close();
////}




