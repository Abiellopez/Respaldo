

    //jQuery.ajax({
    //url: $.MisUrls.url._ObtenerDatos,
    //type: "GET",
    //dataType: "json",
    //contentType: "application/json; charset=utf-8",
    //success: function (data) {

    //    console.log(data)

    //},
    //error: function (error) {
    //    console.log(error)
    //},
    //beforeSend: function () {
    //},
    //   


jQuery.ajax({
    url: $.MisUrls.url._ObtenerDatos,
    type: "GET",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    success: function (data) {

        console.log(data);

        var arrayMeses = [];
        var arrayCantidad = [];

        for (var i = 0; i < data.length; i++) {
            
            console.log(data[i].mes)
            arrayMeses.push(data[i].mes)
            arrayCantidad.push(data[i].cantidad)
        }

        console.log(arrayMeses)
        console.log(arrayCantidad)

        var controlBar1 = document.getElementById("myBarChart");

        var graficoBar1 = new Chart(controlBar1, {
            type: 'bar',
            data: {
                labels: arrayMeses,
                datasets: [{
                    label: "Total Ventas",
                    /*backgroundColor: "#0800B1",*/
                    backgroundColor: ["#03B100", "#0083B1", "#0800B1"],
                    borderColor: "#000000",
                    borderWidth: 0,
                    data: arrayCantidad,
                }],
            },
            options: {
                scales: {
                    xAxes: [{
                        gridLines: {
                            display: true
                        },
                    }],
                    yAxes: [{
                        ticks: {
                            min: 0,
                        },
                        gridLines: {
                            display: true
                        }
                    }],
                },
                legend: {
                    display: true
                }
            }
        });


    },
    error: function (error) {
        console.log(error)
    }
});