


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

})


$('#btnBuscar').on('click', function () {

    jQuery.ajax({
        url: $.MisUrls.url._ObtenerReporteProducto + "?idBodega=" + $("#cboTienda").val() + "&codigoproducto=" + $("#txtCodigoProducto").val(),
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            if (data != undefined && data != null) {

                $("#tbReporte tbody").html("");


                $.each(data, function (i, row) {

                    $("<tr>").append(
                        $("<td>").text(row["NombreBodega"]),
                        $("<td>").text(row["CodigoProducto"]),
                        $("<td>").text(row["NombreProducto"]),
                        $("<td>").text(row["DescripcionProducto"]),
                        $("<td>").text(row["NombreCategoria"]),
                        $("<td>").text(row["NombreMarca"]),
                        $("<td>").text(row["NombreEstilo"]),
                        $("<td>").text(row["NombreTalla"]),
                        $("<td>").text(row["NombreColor"]),
                        $("<td>").text(row["StockenTienda"]),
                        $("<td>").text(row["PrecioCompra"]),
                        $("<td>").text(row["PrecioVenta"])

                    ).appendTo("#tbReporte tbody");
                })
            }
        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });

})

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


























































//var tabladata;

//$(document).ready(function () {
//    activarMenu("Reportes");

//    //OBTENER TIENDAS
//    jQuery.ajax({
//        url: $.MisUrls.url._ObtenerTiendas,
//        type: "GET",
//        dataType: "json",
//        contentType: "application/json; charset=utf-8",
//        success: function (data) {

//            $("#cboTienda").LoadingOverlay("hide");
//            $("#cboTienda").html("");

//            $("<option>").attr({ "value": 0 }).text("-- Seleccionar todas--").appendTo("#cboTienda");
//            if (data.data != null)
//                $.each(data.data, function (i, item) {

//                    if (item.Activo == true) {
//                        $("<option>").attr({ "value": item.IdBodega }).text(item.Nombre).appendTo("#cboTienda");
//                    }
//                })
//        },
//        error: function (error) {
//            console.log(error)
//        },
//        beforeSend: function () {
//            $("#cboTienda").LoadingOverlay("show");
//        },
//    });


//       $('#tbdata').DataTable({
//        responsive: true,
//        "scrollY": "300px",
//        "scrollCollapse": true,
//        "scrollX": true,
//        "paging": false,
//        "language": {
//            "url": $.MisUrls.url.Url_datatable_spanish
//        }
//    })

//})



// function Buscar() {
//    jQuery.ajax({
//        url: $.MisUrls.url._ObtenerReporte + "?idBodega=" + $("#cboTienda").val() + "&codigoproducto=" + $("#txtCodigoProducto").val(),
//        type: "GET",
//        dataType: "json",
//        contentType: "application/json; charset=utf-8",
//        success: function (data) {
//            if (data.data != null) {
//                var json = JSON.parse(data.data)
                
                
//                if ($.fn.DataTable.isDataTable('#tbdata')) {
//                    $('#tbdata').DataTable().destroy();
//                }
  


//           $('#tbdata').DataTable({
//           responsive: true,
//           data: json,
//            columns: [

//                { "data": "Nombre Tienda" },
//                { "data": "Codigo Producto" },
//                { "data": "Nombre Producto" },
//                { "data": "Descripcion Producto" },
//                { "data": "DescripcionCategoria" },
//                { "data": "DescripcionMarca" },
//                { "data": "NombreEstilo" },
//                { "data": "DescripcionTalla" },
//                { "data": "DescripcionColor" },
//                { "data": "Stock en tienda" },
//                { "data": "Precio Compra" },
//                { "data": "PrecioVenta" },
//            //{
//            //    "data": "Id", "render": function (data, type, row, meta) {
//            //        return "<button class='btn btn-primary  btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>"
//            //    },
//            //    "orderable": false,
//            //    "searchable": false,
//            //    "width": "90px"
//            //},


//           ],
//           "scrollY": "300px",
//           "scrollCollapse": true,
//           "scrollX": true,
//           "paging": false,
//           dom: 'Bfrtip',
//           "language": {
//               "url": $.MisUrls.url.Url_datatable_spanish
//           },
//       });


//            } 
//        },
//    });

//}


//function abrirPopUpForm(json) {
  
//    $("#txtid").val(json.Id);
//    $("#txtPrecioVenta").val(json.PrecioVenta);
//    $('#FormModal').modal('show');

//}

//function Guardar() {


//        var request = {
//            objeto: {
//                IdProducto: parseInt($("#txtid").val()),
//                PrecioVenta: parseInt($("#txtPrecioVenta").val()),
//            }
//        }
    
//        jQuery.ajax({
//            url: $.MisUrls.url._GuardarRebaja,
//            type: "POST",
//            data: JSON.stringify(request),
//            dataType: "json",
//            contentType: "application/json; charset=utf-8",
//            success: function (data) {

//                if (data.resultado) {
                  
//                    $('#FormModal').modal('hide');
//                    //var tabladata = $('#tbdata').DataTable();
//                    //var jsonData = json;
//                    //tabladata.ajax.reload(json);
//                    window.location.reload();
//                } else {

//                    swal("Mensaje", "No se pudo guardar los cambios", "warning")
//                }
//            },
//            error: function (error) {
//                console.log(error)
//            },
//            beforeSend: function () {

//            },
//        });

//    }

//$.fn.inputFilter = function (inputFilter) {
//    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function () {
//        if (inputFilter(this.value)) {
//            this.oldValue = this.value;
//            this.oldSelectionStart = this.selectionStart;
//            this.oldSelectionEnd = this.selectionEnd;
//        } else if (this.hasOwnProperty("oldValue")) {
//            this.value = this.oldValue;
//            this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
//        } else {
//            this.value = "";
//        }
//    });
//};

//$("#txtPrecioVenta").inputFilter(function (value) {
//    return /^-?\d*[.]?\d{0,2}$/.test(value);
//});








//function printData() {

//    if ($('#tbdata').length == 0) {
//        swal("Mensaje", "No existen datos para imprimir", "warning")
//        return;
//    }

//    var divToPrint = document.getElementById("tbdata");

//    var style = "<style>";
//    style = style + "table {width: 100%;font: 17px Calibri;}";
//    style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
//    style = style + "padding: 2px 3px;text-align: center;}";
//    style = style + "</style>";

//    newWin = window.open("");


//    newWin.document.write(style);
//    newWin.document.write("<h3>Reporte de productos por Bodega</h3>");
//    newWin.document.write(divToPrint.outerHTML);
//    newWin.print();
//    newWin.close();
//}
