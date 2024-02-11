
var tablaProducto;


function readURL(input) {  
    if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
               $('#imgProducto')
                    .attr('src', e.target.result)
                    .width(190)
                    .height(192);

            };
           
    }
    reader.readAsDataURL(input.files[0]);
   
}


$("#fileProducto").on("change", (e) => {
        const archivo = $(e.target)[0].files[0];
        let nombArchivo = archivo.name;
        var extension = nombArchivo.split(".").slice(-1); extension = extension[0];
        let extensiones = ["jpg", "png", "jpeg"];

        if (extensiones.indexOf(extension) === -1) {
            swal("Mensaje", "Extension de archivo no permitida", "warning")
            $miInput.value = "";
        }
        else {
            reader.readAsDataURL(input.files[0]);
        }

});

const maxSize = 3000000;
const $miInput = document.querySelector("#fileProducto");

$miInput.addEventListener("change", function () {
    const archivo = this.files[0];
    if (archivo.size > maxSize) {
        const tamanioEnMb = maxSize / 1000000;
        alert(`El tamaño máximo es ${tamanioEnMb} MB`);
        $miInput.value = "";
    }
    else {
        reader.readAsDataURL(input.files[0]);
    }
});


$(document).ready(function () {
    activarMenu("Mantenedor");


    ////validamos el formulario
    $("#form").validate({
        rules: {
            
            Nombre: "required",
            Descripcion: "required"
        },
        messages: {
   
            Nombre: "(*)",
            Descripcion: "(*)"

        },
        errorElement: 'span'
    });

    //OBTENER CATEGORIAS
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerCategorias,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $("#cboCategoria").html("");

            if (data.data != null) {
                $.each(data.data, function (i, item) {

                    if (item.Activo == true) {
                        $("<option>").attr({ "value": item.IdCategoria }).text(item.Descripcion).appendTo("#cboCategoria");
                    }
                })
                $("#cboCategoria").val($("#cboCategoria option:first").val());
            }

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });


    //OBTENER MARCA
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerMarca,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $("#cboMarca").html("");

            if (data.data != null) {
                $.each(data.data, function (i, item) {

                    if (item.Activo == true) {
                        $("<option>").attr({ "value": item.CodigoMarca }).text(item.Nombre).appendTo("#cboMarca");
                    }
                })
                $("#cboMarca").val($("#cboMarca option:first").val());
            }

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });


    //OBTENER ESTILO
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerEstilo,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $("#cboEstilo").html("");

            if (data.data != null) {
                $.each(data.data, function (i, item) {

                    if (item.Activo == true) {
                        $("<option>").attr({ "value": item.CodigoEstilo }).text(item.Nombre).appendTo("#cboEstilo");
                    }
                })
                $("#cboEstilo").val($("#cboEstilo option:first").val());
            }

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });


    //OBTENER TALLA
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerTalla,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $("#cboTalla").html("");

            if (data.data != null) {
                $.each(data.data, function (i, item) {

                    if (item.Activo == true) {
                        $("<option>").attr({ "value": item.IdTalla }).text(item.Nombre).appendTo("#cboTalla");
                    }
                })
                $("#cboTalla").val($("#cboTalla option:first").val());
            }

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });

    //OBTENER COLOR
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerColor,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $("#cboColor").html("");

            if (data.data != null) {
                $.each(data.data, function (i, item) {

                    if (item.Activo == true) {
                        $("<option>").attr({ "value": item.IdColor }).text(item.Nombre).appendTo("#cboColor");
                    }
                })
                $("#cboColor").val($("#cboColor option:first").val());
            }

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });



    tabladata = $('#tbdata').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerProductos,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
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
            },
            {
                "data": "Activo", "render": function (data) {
                    if (data) {
                        return '<span class="badge badge-success">Activo</span>'
                    } else {
                        return '<span class="badge badge-danger">No Activo</span>'
                    }
                }
            },
            {
                "data": "IdProducto", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary  btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>" +
                        "<button class='btn btn-danger btn-sm ml-2' type='button' onclick='eliminar(" + data + ")'><i class='fa fa-trash'></i></button>"



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

    $("#txtid").val(0);

    if (json != null) {

        $("#txtid").val(json.IdProducto);
        $("#imgProducto").attr({ "src": "data:image/" + json.extension + ";base64," + json.base64 });
        $("#txtCodigo").val(json.Codigo);
        $("#txtNombre").val(json.Nombre);
        $("#txtDescripcion").val(json.Descripcion);
        $("#cboCategoria").val(json.IdCategoria);
        $("#cboMarca").val(json.CodigoMarca);
        $("#cboEstilo").val(json.CodigoEstilo);
        $("#cboTalla").val(json.IdTalla);
        $("#cboColor").val(json.IdColor);
        $("#cboEstado").val(json.Activo == true ? 1 : 0);
        $("#txtCodigo").prop("disabled", true)

    } else {

        $("#txtCodigo").val("AUTOGENERADO");
        $("#imgProducto").attr({ "src": "" });
        $("#txtCodigo").prop("disabled", true)
        $("#txtNombre").val("");
        $("#txtDescripcion").val("");
        $("#cboCategoria").val($("#cboCategoria option:first").val());
        $("#cboMarca").val($("#cboMarca option:first").val());
        $("#cboEstilo").val($("#cboEstilo option:first").val());
        $("#cboTalla").val($("#cboTalla option:first").val());
        $("#cboColor").val($("#cboColor option:first").val());
        $("#cboEstado").val(1);
    }

    $('#FormModal').modal('show');

}






function Guardar() {
    if ($("#form").valid()) {
  
        var ImagenSeleccionada = ($("#fileProducto"))[0].files[0];

        var objeto = {
            IdProducto: $("#txtid").val(),
            Nombre: $("#txtNombre").val(),
            Descripcion: $("#txtDescripcion").val(),
            IdCategoria: $("#cboCategoria").val(),
            CodigoMarca: $("#cboMarca").val(),
            CodigoEstilo: $("#cboEstilo").val(),
            IdTalla: $("#cboTalla").val(),
            IdColor: $("#cboColor").val(),
            Activo: ($("#cboEstado").val() == "1" ? true : false)
        }
        if ($("#fileProducto").val().trim() == "") {
            swal("Mensaje", "Agregue una imagen", "warning");
            console.log(error)
            return;

        }
        else
        { 
        var request = new FormData();
        request.append("imagenArchivo", ImagenSeleccionada);
        request.append("objeto", JSON.stringify(objeto));
        }

        jQuery.ajax({
            url: $.MisUrls.url._GuardarProducto,
            type: "POST",
            data: request,
            processData: false,
            contentType: false,
            success: function (data) {

                if (data.resultado) {
                    console.log(data)
                    tabladata.ajax.reload();
                    $('#FormModal').modal('hide');


                } else {
                    console.log(data)
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
}






function eliminar($id) {


    swal({
        title: "Mensaje",
        text: "¿Desea eliminar el producto seleccionado?",
        type: "warning",
        showCancelButton: true,

        confirmButtonText: "Si",
        confirmButtonColor: "#DD6B55",

        cancelButtonText: "No",

        closeOnConfirm: true
    },

        function () {
            jQuery.ajax({
                url: $.MisUrls.url._EliminarProducto + "?id=" + $id,
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (data.resultado) {
                        tabladata.ajax.reload();
                    } else {
                        swal("Mensaje", "No se pudo eliminar el producto", "warning")
                    }
                },
                error: function (error) {
                    console.log(error)
                },
                beforeSend: function () {

                },
            });
        });

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
