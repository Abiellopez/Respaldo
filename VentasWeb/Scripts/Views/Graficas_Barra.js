

//function Grafica() {

//    fetch($.MisUrls.url._ObtenerDatos)
//        .then((response) => {
//            return response.ok ? response.json() : Promise.reject(response);
//        })
//        .then((dataJson) => {


//            console.log(dataJson)
//            const labels = dataJson.map((item) => { return item.FechaMes })
//         /*   const año = dataJson.map((item) => { return item.FechaVenta })*/
//            const values = dataJson.map((item) => { return item.CantidadProductos })

//            console.log(labels)
//            console.log(values)
//           /* console.log(año)*/


//            const data = {
//                labels: labels,
//                datasets: [{
//                    label: 'Cantidad de ventas',
//                    data: values, 
//                    backgroundColor: 'rgb(54, 162, 235)',
//                    borderWidth: 1
//                }]
//            };

//            const config = {
//                type: 'bar',
//                data: data,
//                options: {
//                    scales: {
//                        y: {
//                            beginAtZero: true
//                        }
//                    }
//                },
//            };


//            const canvasBarras = document.getElementById("chartVentas");

//            const graficoBarras = new Chart(canvasBarras, config)


//        })
//}


function GraficaPastel() {

    fetch($.MisUrls.url._ObtenerDatosChart)
        .then((response) => {
            return response.ok ? response.json() : Promise.reject(response);
        })
        .then((dataJson) => {



            const labels = dataJson.map((item) => { return item.producto })
            const values = dataJson.map((item) => { return item.cantidad })
            //console.log(labels)
            //console.log(values)
            const data = {
                labels: labels,
                datasets: [{
                    label: 'Cantidad',
                    data: values,
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(255, 205, 86)',
                        "#01AF40"
                    ],
                    hoverOffset: 4
                }]
            };


            const config = {
                type: 'doughnut',
                data: data,
            };


            const canvasDona = document.getElementById("chartProductos");

            const graficoDona = new Chart(canvasDona, config)

        }).catch((error) => {
            console.log("error")

        })


}



function resumen() {

    fetch($.MisUrls.url._Resumen)
        .then((response) => {
            return response.ok ? response.json() : Promise.reject(response);
        })
        .then((dataJson) => {

            const labels = dataJson.map((item) => { return item.Fecha })
            /*   const año = dataJson.map((item) => { return item.FechaVenta })*/
            const values = dataJson.map((item) => { return item.Cantidad })

            console.log(labels)
            console.log(values)
            /* console.log(año)*/


            const data = {
                labels: labels,
                datasets: [{
                    label: 'Cantidad de ventas',
                    data: values,
                    backgroundColor: 'rgb(54, 162, 235)',
                    borderWidth: 1
                }]
            };

            const config = {
                type: 'bar',
                data: data,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                },
            };


            const canvasBarras = document.getElementById("chart");

            const graficoBarras = new Chart(canvasBarras, config)


        })
}

    $(document).ready(() => {
     /*   Grafica()*/
        GraficaPastel()
        resumen()
     })
