var tablaproducto;
var tablacliente;

$(document).ready(function () {

    activarMenu("Ventas");
    $("#txtproductocantidad").val("0");
    $("#txtfechaventa").val(ObtenerFecha());


    //OBTENER Usuario
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerUsuario,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            //USUARIO
            $("#txtIdUsuario").val(data.IdUsuario);
            $("#lblempleadonombre").text(data.Nombres);
            $("#lblempleadoapellido").text(data.Apellidos);
            $("#lblempleadocorreo").text(data.Correo);
        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
            $("#cboProveedor").LoadingOverlay("show");
        },
    });



    /* OBTENER PRODUCTOS*/
   
    tablaproducto = $('#tbProducto').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerProductoStockPorTienda,
            "type": "GET",
            "datatype": "json",
        },

        "columns": [
            {
                "data": "IdProductoBodega", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-sm btn-warning ml-2' type='button' onclick='productoSelect(" + JSON.stringify(row) + ")'>Add</button>"
                },
            },

            {
                "data": "oProducto", render: function (data) {
                    return data.Codigo
                }
            },

            {
                "data": "oProducto", render: function (data) {
                    return data.Nombre
                }
            },
            {
                "data": "oProducto", render: function (data) {
                    return data.Descripcion
                }
            },
            {
                "data": "oMarca", render: function (data) {
                    return data.Nombre
                }
            },

            {
                "data": "oTalla", render: function (data) {
                    return data.Nombre
                }
            },
            {
                "data": "oColor", render: function (data) {
                    return data.Nombre
                }
            },

            { "data": "Stock" }


        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

    tablacliente = $('#tbcliente').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerClientes,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "IdCliente", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-sm btn-warning ml-2' type='button' onclick='clienteSelect(" + JSON.stringify(row) + ")'>Add</button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            },
            { "data": "TipoDocumento" },
            { "data": "NumeroDocumento" },
            { "data": "Nombre" },
            { "data": "Direccion" }
        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

})

function ObtenerFecha() {

    var d = new Date();
    var month = d.getMonth() + 1;
    var day = d.getDate();
    var output = (('' + day).length < 2 ? '0' : '') + day + '/' + (('' + month).length < 2 ? '0' : '') + month + '/' + d.getFullYear();

    return output;
}


$.fn.inputFilter = function (inputFilter) {
    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function () {
        if (inputFilter(this.value)) {
            this.oldValue = this.value;
            this.oldSelectionStart = this.selectionStart;
            this.oldSelectionEnd = this.selectionEnd;
        } else if (this.hasOwnProperty("oldValue")) {
            this.value = this.oldValue;
            this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
        } else {
            this.value = "";
        }
    });
};

$("#txtproductocantidad").inputFilter(function (value) {
    return /^-?\d*$/.test(value);
});

$("#txtmontopago").inputFilter(function (value) {
    return /^-?\d*[.]?\d{0,2}$/.test(value);
});


$('#btnBuscarCliente').on('click', function () {

    tablacliente.ajax.reload();

    $('#modalCliente').modal('show');
})
var imagenDireccion = "";
function productoSelect(json) {
    $("#txtIdProducto").val(json.oProducto.IdProducto);
    $("#txtproductocodigo").val(json.oProducto.Codigo);
    $("#txtproductonombre").val(json.oProducto.Nombre);
    $("#txtproductodescripcion").val(json.oProducto.Descripcion);
    $("#txtproductostock").val(json.Stock);
    $("#txtproductoprecio").val(json.PrecioUnidadVenta);
    $("#txtproductocantidad").val("0");
    $("#imgProducto").attr({ "src": "data:image/" + json.oProducto.extension + ";base64," + json.oProducto.base64 });
    imagenDireccion = "data:image/" + json.oProducto.extension + ";base64," + json.oProducto.base64;
    $('#modalProducto').modal('hide');
}

function clienteSelect(json) {

    $("#cboclientetipodocumento").val(json.TipoDocumento);
    $("#txtclientedocumento").val(json.NumeroDocumento);
    $("#txtclientenombres").val(json.Nombre);
    $("#txtclientedireccion").val(json.Direccion);
    $("#txtclientetelefono").val(json.Telefono);
    $('#modalCliente').modal('hide');
}


$("#txtproductocodigo").on('keypress', function (e) {


    if (e.which == 13) {

        var request = { IdBodega: parseInt($("#txtIdBodega").val()) }

        jQuery.ajax({
            url: $.MisUrls.url._ObtenerProductoStockPorTienda + "?IdBodega=" + parseInt($("#txtIdBodega").val()),
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                var encontrado = false;
                if (data.data != null) {
                    $.each(data.data, function (i, item) {
                        if (item.oProducto.Codigo == $("#txtproductocodigo").val()) {

                            $("#txtIdProducto").val(item.oProducto.IdProducto);
                            $("#txtproductocodigo").val(item.oProducto.Codigo);
                            $("#txtproductonombre").val(item.oProducto.Nombre);
                            $("#txtproductodescripcion").val(item.oProducto.Descripcion);
                            $("#txtproductostock").val(item.Stock);
                            $("#txtproductoprecio").val(item.PrecioUnidadVenta);
                            $("#imgProducto").attr({ "src": "data:image/" + item.oProducto.extension + ";base64," + item.oProducto.base64 });
                            imagenDireccion = "data:image/" + item.oProducto.extension + ";base64," + item.oProducto.base64;
                            encontrado = true;
                            return false;
                        }
                    })

                    if (!encontrado) {

                        $("#txtIdProducto").val("0");
                        $("#txtproductocodigo").val("");
                        $("#txtproductonombre").val("");
                        $("#txtproductodescripcion").val("");        
                        $("#txtproductostock").val("");
                        $("#txtproductoprecio").val("");
                        $("#txtproductocantidad").val("0");
                        $("#imgProducto").attr({ "src": "" });

                    }
                }

            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {
                $("#cboProveedor").LoadingOverlay("show");
            },
        });



    }
});


$('#btnAgregar').on('click', function () {


    $("#txtproductocantidad").val($("#txtproductocantidad").val() == "" ? "0" : $("#txtproductocantidad").val());

    var existe_codigo = false;
    if (
       (parseInt($("#txtIdProducto").val()) == 0 ||
            parseFloat($("#txtproductocantidad").val()) == 0)
       )
    {
        swal("Mensaje", "Debe completar todos los campos del producto", "warning")
        return;
    }


    let cantidad = parseFloat($("#txtproductocantidad").val());
    let stock = parseInt($("#txtproductostock").val())
    if (cantidad > stock) {
        swal("Mensaje", "la cantidad ingresada supera al stock", "warning")
        return;
    }



    $('#tbVenta > tbody  > tr').each(function (index, tr) {
        var fila = tr;
        
        var idproducto = $(fila).find("td.producto").data("idproducto");

        if (
            idproducto == $("#txtIdProducto").val())
            
        {
            existe_codigo = true;
            return false;
        }

    });

    if (!existe_codigo) {

        controlarStock(parseInt($("#txtIdProducto").val()), parseInt($("#txtproductocantidad").val()), true);

        var importetotal = parseFloat($("#txtproductoprecio").val()) * parseFloat($("#txtproductocantidad").val());
        $("<tr>").append(
            $("<td>").append(
                $("<button><i class='fa fa-trash'></i></button>").addClass("btn btn-danger btn-sm ml-2").data("idproducto", parseInt($("#txtIdProducto").val())).data("cantidadproducto", parseInt($("#txtproductocantidad").val()))
            ),
            $("<td>").append(
                $("<button><i class='fas fa-pen'></i></button>").addClass("btn btn-primary btn-sm")
                    .data("idproducto", parseInt($("#txtIdProducto").val()))
                    .data("cantidadproducto", parseInt($("#txtproductocantidad").val()))
                    .data("nombre", String($("#txtproductonombre").val()))
                    .data("descripcion", String($("#txtproductodescripcion").val()))
                    .data("precio", parseInt($("#txtproductoprecio").val()))
                    .data("Stock", parseInt($("#txtproductostock").val()))
                    .data("Codigo", String($("#txtproductocodigo").val()))
                    .data("Imagen", String($("#imgProducto").val()))
            ),


            $("<td>").addClass("productocantidad").text($("#txtproductocantidad").val()),
            $("<td>").addClass("producto").data("idproducto", $("#txtIdProducto").val()).text($("#txtproductonombre").val()),
            $("<td>").text($("#txtproductodescripcion").val()),
            $("<td>").addClass("productoprecio").text($("#txtproductoprecio").val()),
            $("<td>").addClass("importetotal").text(importetotal),

        ).appendTo("#tbVenta tbody");

        $("#txtIdProducto").val("0");
        $("#txtproductocodigo").val("");
        $("#txtproductonombre").val("");
        $("#txtproductodescripcion").val("");
        $("#txtproductostock").val("");
        $("#txtproductoprecio").val("");
        $("#txtproductocantidad").val("0");  
        $("#imgProducto").attr({ "src": imagenDireccion });
        $("#txtproductocodigo").focus();

   calcularPrecios();
    } else {
        swal("Mensaje", "El producto ya existe en la venta", "warning")
    }
})

$('#tbVenta tbody').on('click', 'button[class="btn btn-danger btn-sm ml-2"]', function () {
    var idproducto = $(this).data("idproducto");
    var cantidadproducto = $(this).data("cantidadproducto");

    controlarStock(idproducto, cantidadproducto, false);
    $(this).parents("tr").remove();

    calcularPrecios();
})


$('#tbVenta tbody').on('click', 'button[class="btn btn-primary btn-sm"]', function () {

    var idproducto = $(this).data("idproducto");
    let Codigo = $(this).data("Codigo");
    var cantidadproducto = $(this).data("cantidadproducto");
    var nombre = $(this).data("nombre");
    var descripcion = $(this).data("descripcion");
    var Imagen = $(this).data("Imagen");
    var precio = $(this).data("precio");
    let Stock = $(this).data("Stock");

    console.log(nombre);

    controlarStock(idproducto, cantidadproducto, false);
    $(this).parents("tr").remove();

    $("#txtIdProducto").val(idproducto);
    $("#txtproductocodigo").val(Codigo);
    $("#txtproductonombre").val(nombre);
    $("#txtproductodescripcion").val(descripcion);
    $("#txtproductostock").val(Stock);
    $("#txtproductoprecio").val(precio);
    $("#txtproductocantidad").val("");
    $("#imgProducto").attr({ "src": Imagen});

    $("#txtproductocantidad").focus();

    calcularPrecios();

})

$(document).on('click', 'button[class="btn btn-primary btn-sm"]', function () {
    var idproducto = $(this).data("idproducto");
    $("#txtIdProducto").val(idproducto);
    $("#imgProducto").attr({ "src": imagenDireccion});

});


$('#btnTerminarGuardarVenta').on('click', function () {

    //VALIDACIONES DE CLIENTE
    //if ($("#txtclientedocumento").val().trim() == "" || $("#txtclientenombres").val().trim() == "") {
    //    swal("Mensaje", "Complete los datos del cliente", "warning");
    //    return;
    //}
    //VALIDACIONES DE PRODUCTOS
    if ($('#tbVenta tbody tr').length == 0) {
        swal("Mensaje", "Debe registrar minimo un producto en la venta", "warning");
        return;
    }

    //VALIDACIONES DE MONTO PAGO
    if ($("#txtmontopago").val().trim() == "") {
        swal("Mensaje", "Ingrese el monto de pago", "warning");
        return;
    }

    var $totalproductos = 0;
    var $totalimportes = 0;

    var DETALLE = "";
    var VENTA = "";
    var DETALLE_CLIENTE = "";
    var DETALLE_VENTA = "";
    var DATOS_VENTA = "";

    calcularCambio();

    $('#tbVenta > tbody  > tr').each(function (index, tr) {
        var fila = tr;
        var productocantidad = parseInt($(fila).find("td.productocantidad").text());
        var idproducto = $(fila).find("td.producto").data("idproducto");
        var productoprecio = parseFloat($(fila).find("td.productoprecio").text());
        var importetotal = parseFloat($(fila).find("td.importetotal").text());
        $totalproductos = $totalproductos + productocantidad;
        $totalimportes = $totalimportes + importetotal;


        DATOS_VENTA = DATOS_VENTA + "<DATOS>" +
            "<IdVenta>0</IdVenta >" +
            "<IdProducto>" + idproducto + "</IdProducto>" +
            "<Cantidad>" + productocantidad + "</Cantidad>" +
            "<PrecioUnidad>" + productoprecio + "</PrecioUnidad>" +
            "<ImporteTotal>" + importetotal + "</ImporteTotal>" +
      
            "</DATOS>"
    });


    VENTA = "<VENTA>" +
        "<IdUsuario>" + $("#txtIdUsuario").val() + "</IdUsuario>" +
        "<IdCliente>0</IdCliente>" +
        "<TipoDocumento>" + $("#cboventatipodocumento").val() + "</TipoDocumento>" +
        "<CantidadProducto>" + $('#tbVenta tbody tr').length + "</CantidadProducto>" +
        "<CantidadTotal>" + $totalproductos + "</CantidadTotal>" +
        "<TotalCosto>" + $totalimportes + "</TotalCosto>" +
        "<IVA>" + $("#txtigv").val() + "</IVA>" +
        "<Descuento>" + $("#txtDescuento").val() + "</Descuento>" +
        "<ImporteRecibido>" + $("#txtmontopago").val() + "</ImporteRecibido>" +
        "<ImporteCambio>" + $("#txtcambio").val() + "</ImporteCambio>" +
       
        "</VENTA >";

    DETALLE_CLIENTE = "<DETALLE_CLIENTE><DATOS>" +
        "<TipoDocumento>" + $("#cboclientetipodocumento").val() + "</TipoDocumento>" +
        "<NumeroDocumento>" + $("#txtclientedocumento").val() + "</NumeroDocumento>" +
        "<Nombre>" + $("#txtclientenombres").val() + "</Nombre>" +
        "<Direccion>" + $("#txtclientedireccion").val() + "</Direccion>" +
        "<Telefono>" + $("#txtclientetelefono").val() + "</Telefono>" +
        "</DATOS></DETALLE_CLIENTE>";

    DETALLE_VENTA = "<DETALLE_VENTA>" + DATOS_VENTA + "</DETALLE_VENTA>";

    DETALLE = "<DETALLE>" + VENTA + DETALLE_CLIENTE + DETALLE_VENTA + "</DETALLE>"


    var request = { xml: DETALLE };

    jQuery.ajax({
        url: $.MisUrls.url._RegistrarVenta,
        type: "POST",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $(".card-venta").LoadingOverlay("hide");

            if (data.estado) {
                //DOCUMENTO
                $("#cboventatipodocumento").val("Factura");

                //CLIENTE
                $("#cboclientetipodocumento").val("DUI");
                $("#txtclientedocumento").val("");
                $("#txtclientenombres").val("");
                $("#txtclientedireccion").val("");
                $("#txtclientetelefono").val("");


                //PRODUCTO
                $("#txtIdProducto").val("0");
                $("#txtproductocodigo").val("");
                $("#txtproductonombre").val("");
                $("#txtproductodescripcion").val("");
                $("#txtproductostock").val("");
                $("#txtproductoprecio").val("");
                $("#txtproductocantidad").val("0");

                //PRECIOS
                $("#txtsubtotal").val("0");
                $("#txtigv").val("0");
                $("#txtDescuento").val("0.00");
                $("#txttotal").val("0");
                $("#txtmontopago").val("");
                $("#txtcambio").val("");



                $("#tbVenta tbody").html("");


                var url = $.MisUrls.url._DocumentoVenta + "?IdVenta=" + data.valor;
                window.open(url);


            } else {
                swal("Mensaje", "No se pudo registrar la venta", "warning")
            }
        },
        error: function (error) {
            console.log(error)
            $(".card-venta").LoadingOverlay("hide");
        },
        beforeSend: function () {
            $(".card-venta").LoadingOverlay("show");
        }
    });



})

function calcularCambio() {
    var montopago = $("#txtmontopago").val().trim() == "" ? 0 : parseFloat($("#txtmontopago").val().trim());
    var totalcosto = parseFloat($("#txttotal").val().trim());
    var Desc = parseFloat($("#txtDescuento").val().trim());
    var cambio = 0;

    cambio = (montopago <= totalcosto ? totalcosto : montopago) - (totalcosto - (totalcosto * Desc));

    $("#txtcambio").val(cambio.toFixed(2));
}



$('#btncalcular').on('click', function () {
    calcularCambio();
})


function calcularPrecios() {
    var subtotal = 0;
    var igv = 0;
    var Descuento = 0;
    var sumatotal = 0;
    $('#tbVenta > tbody  > tr').each(function (index, tr) {
        var fila = tr;
        var importetotal = parseFloat($(fila).find("td.importetotal").text());
        sumatotal = sumatotal + importetotal;
    });
    igv = sumatotal * 0.15;
    subtotal = sumatotal - igv;
    Descuento = sumatotal - (sumatotal * Descuento);

    $("#txtsubtotal").val(subtotal.toFixed(2));
    $("#txtigv").val(igv.toFixed(2));
    $("#txttotal").val(sumatotal.toFixed(2));
}


function controlarStock($idproducto, $cantidad, $restar) {
    var request = {
        idproducto: $idproducto,
        cantidad: $cantidad,
        restar: $restar
    }


    jQuery.ajax({
        url: $.MisUrls.url._ControlarStockProducto,
        type: "POST",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });


}


window.onbeforeunload = function () {
    if ($('#tbVenta tbody tr').length > 0) {

        $('#tbVenta > tbody  > tr').each(function (index, tr) {
            var fila = tr;
            var productocantidad = parseInt($(fila).find("td.productocantidad").text());
            var idproducto = $(fila).find("td.producto").data("idproducto");

            controlarStock(parseInt(idproducto), parseInt(productocantidad), false);
        });
    }
};
