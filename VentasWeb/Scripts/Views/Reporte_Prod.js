
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
        url: $.MisUrls.url._ObtenerReporte + "?idBodega=" + $("#cboTienda").val() + "&codigoproducto=" + $("#txtCodigoProducto").val(),
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.data != null) {
                var json = JSON.parse(data.data)
                
                
                if ($.fn.DataTable.isDataTable('#tbdata')) {
                    $('#tbdata').DataTable().destroy();
                }
             console.log(data)


       $('#tbdata').DataTable({
           responsive: true,
           data: json,
            columns: [

                { "data": "Nombre Tienda" },
                { "data": "Codigo Producto" },
                { "data": "Nombre Producto" },
                { "data": "Descripcion Producto" },
                { "data": "DescripcionCategoria" },
                { "data": "DescripcionMarca" },
                { "data": "NombreEstilo" },
                { "data": "DescripcionTalla" },
                { "data": "DescripcionColor" },
                { "data": "Stock en tienda" },
                { "data": "Precio Compra" },
                { "data": "PrecioVenta" },
            {
                "data": "Id", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary  btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            },


           ],
           "scrollY": "300px",
           "scrollCollapse": true,
           "scrollX": true,
           "paging": false,
           dom: 'Bfrtip',
           "language": {
               "url": $.MisUrls.url.Url_datatable_spanish
           },
       });


            } 
        },
    });

}



function abrirPopUpForm(json) {
  
    $("#txtid").val(json.Id);
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
                 
                    $('#FormModal').modal('hide');
                    tabladata.ajax.reload();
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

    if ($('#tbdata').length == 0) {
        swal("Mensaje", "No existen datos para imprimir", "warning")
        return;
    }

    var divToPrint = document.getElementById("tbdata");

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
