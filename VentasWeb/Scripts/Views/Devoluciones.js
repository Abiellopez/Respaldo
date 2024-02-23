var table;

var tablaProducto;


$(document).ready(function () {



    ////validamos el formulario
    $("#form").validate({
        rules: {
            Motivo: "required",
        },
        messages: {
            Motivo: "(*)",

        },
        errorElement: 'span'
    });


    tablaproducto = $('#tbProducto').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerProductos,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "IdProducto", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-sm btn-warning ml-2' type='button' onclick='productoSelect(" + JSON.stringify(row) + ")'>Add</button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            },
            { "data": "Codigo" },
            { "data": "Nombre" },
            { "data": "Descripcion" },

            {
                "data": "oCategoria", render: function (data) {
                    return data.Descripcion
                }
            },

            {
                "data": "oMarca", render: function (data) {
                    return data.Nombre
                }
            },


            {
                "data": "oEstilo", render: function (data) {
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
            }
        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });






    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '< Ant',
        nextText: 'Sig >',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };


    $.datepicker.setDefaults($.datepicker.regional['es']);
    activarMenu("Reportes");

    $("#txtFechaInicio").datepicker();
    $("#txtFechaFin").datepicker();
    $("#txtFechaInicio").val(ObtenerFecha());
    $("#txtFechaFin").val(ObtenerFecha());
});




function buscarProducto() {
    tablaproducto.ajax.reload();
    $('#modalProducto').modal('show');
}



$('#btnBuscar').on('click', function () {

    jQuery.ajax({
        url: $.MisUrls.url._ObtenerDevoluciones + "?fechainicio=" + $("#txtFechaInicio").val() + "&fechafin=" + $("#txtFechaFin").val(),
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            if (data != undefined && data != null) {

                $("#tbReporte tbody").html("");


                $.each(data, function (i, row) {

                    $("<tr>").append(
     /*                   $("<td>").text(row[""]),*/
                        $("<td>").text(row["FechaDevolucion"]),
                        $("<td>").text(row["Motivo"]),
                        $("<td>").text(row["Cantidad"]),
                        $("<td>").text(row["Nombre"]),
                        $("<td>").text(row["Codigo"])

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



function ObtenerFecha() {

    var d = new Date();
    var month = d.getMonth() + 1;
    var day = d.getDate();
    var output = (('' + day).length < 2 ? '0' : '') + day + '/' + (('' + month).length < 2 ? '0' : '') + month + '/' + d.getFullYear();

    return output;
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
    newWin.document.write("<h3>Reporte de devoluciones</h3>");
    newWin.document.write(divToPrint.outerHTML);
    newWin.print();
    newWin.close();
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


$("#txtCantidad").inputFilter(function (value) {
    return /^-?\d*[.]?\d{0,2}$/.test(value);
});


function productoSelect(json) {
    $("#txtIdProducto").val(json.IdProducto);
    $("#txtNombre").val(json.IdProducto);
    $('#modalProducto').modal('hide');
}

function RegistrarDev() {



        var request = {
            objeto: {
                Codigo: $("#txtCodigo").val(),
                Cantidad: parseInt($("#txtCantidad").val()),
                Motivo: $("#txtMotivo").val(),
                Nombre: $("#txtNombre").val(),
            
            }
        }

        jQuery.ajax({
            url: $.MisUrls.url._GuardarDevolucion,
            type: "POST",
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                if (data.resultado) {
                    swal("Mensaje", "Factura anulada", "success")
                    table.ajax.reload();
                    $("#txtCodigo").val("");
                    $("#txtCantidad").val("");
                    $("#txtMotivo").val("");
                 
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


