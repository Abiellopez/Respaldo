
$(document).ready(function () {

    activarMenu("Configuracion");

    //OBTENER CONFIGURACION



    tabladata = $('#tbdata').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerConfig,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "RUC" },
            { "data": "NombreLocal" },
            { "data": "NombrePropietaria" },
            { "data": "Direccion" },
            { "data": "Telefono" },
            { "data": "Correo" },
            { "data": "Linea" },
            { "data": "Fiscal" },
            { "data": "Descripcion" },
            {
                "data": "IdConfiguracion", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary  btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>" 
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            }

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });
})






function abrirPopUpForm(json) {

    $("#txtidConfiguracion").val(json.IdConfiguracion);
    $("#txtRUC").val(json.RUC);
    $("#txtNombreLocal").val(json.NombreLocal);
    $("#txtNombrePropietaria").val(json.NombrePropietaria);
    $("#txtDireccion").val(json.Direccion);
    $("#txtTelefono").val(json.Telefono);
    $("#txtCorreo").val(json.Correo);
    $("#txtLinea").val(json.Linea);
    $("#txtFiscal").val(json.Fiscal);
    $("#txtDescripcion").val(json.Descripcion);
    $('#FormModal').modal('show');

}

function Guardar() {


        var request = {
            objeto: {
                IdConfiguracion: parseInt($("#txtidConfiguracion").val()),
                RUC : $("#txtRUC").val(),
                NombreLocal: $("#txtNombreLocal").val(),
                NombrePropietaria: $("#txtNombrePropietaria").val(),
                Direccion: $("#txtDireccion").val(),
                telefono: parseInt($("#txtTelefono").val()),
                Correo: $("#txtCorreo").val(),
                Linea: parseInt($("#txtLinea").val()),
                Fiscal: $("#txtFiscal").val(),
                Descripcion: $("#txtDescripcion").val(),
            
            }
        }

        jQuery.ajax({
            url: $.MisUrls.url._GuardarConfiguracion,
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