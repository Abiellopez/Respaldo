

function Grafica() {

    fetch($.MisUrls.url._ObtenerDatos)
        .then((response) => {
            return response.ok ? response.json() : Promise.reject(response);
        })
        .then((dataJson) => {


            console.log(dataJson)
                 const labels = dataJson.map((item) => { return item.FechaVenta })
            const values = dataJson.map((item) => { return item.CantidadProductos })

            console.log(labels)
            console.log(values)


            const data = {
                labels: labels,
                datasets: [{
                    label: 'CantidadProductos',
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


            const canvasBarras = document.getElementById("chartVentas");

            const graficoBarras = new Chart(canvasBarras, config)


        })
}



    $(document).ready(() => {
        Grafica()
    
     })
