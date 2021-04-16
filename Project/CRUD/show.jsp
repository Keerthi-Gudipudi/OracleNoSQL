<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<html>

<head>

    <style>
        .chart-container {
            text-align: center;
        }

        .canvas {
            width: 60% !important;
            height: 65% !important;
            margin: 0 auto;
            margin-top: 8%
        }

    </style>

</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

    <div class='chart-container'>
        <canvas class="canvas" id="canvas"></canvas>

    </div>

    <script type="text/javascript">

    </script>



</body>
<script>
    $(document).ready(function() {
        var value = '${result}';
//        value=value.replace(/\[/g, '');
//        value=value.replace(/\]/g, ',');
//        value = value.replace(/,\s*$/, "");
//       value=value.split("},")
//        var output=[]
//        
//        for(i in value)
//        {
//            value[i]=value[i]+"}"
//            
//            JSON.parse(value[i])
//        
//        }
//        console.log()
        var op = '${op}'
    
        if (op == '1') {
            var item = JSON.parse(value);
            //console.log(value[0])
            console.log(item[0].Year)
            count = {};

            item.forEach(function(a) {
                //console.log(a)
                count[a.Year] = (count[a.Year] || 0) + 1;

            });


            var labels = item.map(function(e) {
                return e.Year;
            });

            console.log(item)
            year = [...new Set(labels)]
            year.sort()
            var data = []
            for (i in year) {
                data.push(count[year[i]])
            }

            var ctx = canvas.getContext('2d');
            var config = {
                type: 'line',
                data: {
                    labels: year,

                    datasets: [{
                        label: 'Songs released per year',
                        data: data,
                        fill: false,
                        borderColor: 'orange',
                        backgroundColor: 'transparent'

                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                fontSize: 16,
                                fontFamily: "'Roboto', sans-serif",
                                fontColor: '#000',
                                fontStyle: '500'
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                fontSize: 16,
                                fontFamily: "'Roboto', sans-serif",
                                fontColor: '#000',
                                fontStyle: '500'
                            }
                        }]
                    }
                }
            };
            var chart = new Chart(ctx, config);
        }
        if (op == '2') {
            var item = JSON.parse(value);
            console.log(item)
            count = {}
            for (i in item) {
                if (item[i].count > 100) {
                    // console.log(item[i].count)
                    count[item[i].Artists] = item[i].count
                }
            }
            labels = Object.keys(count)
            var data = []
            for (i in labels) {
                data.push(count[labels[i]])
            }

            var ctx = canvas.getContext('2d');
            var config = {
                type: 'bar',
                data: {
                    labels: Object.keys(count),
                    datasets: [{
                        label: 'number of songs released by artist (>100)',
                        data: data,
                        // backgroundColor: "#3e95cd"
                        fill: false,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)'
                        ],
                        borderColor: [
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)'
                        ],
                        borderWidth: 1
                        //borderColor: "red",

                        //"#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#d49", "#ff7"
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                fontSize: 16,
                                fontFamily: "'Roboto', sans-serif",
                                fontColor: '#000',
                                fontStyle: '500'
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                fontSize: 16,
                                fontFamily: "'Roboto', sans-serif",
                                fontColor: '#000',
                                fontStyle: '500'
                            }
                        }]
                    }
                }
            };
            var chart = new Chart(ctx, config);
        }

        if (op == '3') {
            var item = JSON.parse(value);
            //console.log(item)
            artists_0={}
            artists_1={}
            for(i in item){
                if(item[i].mode==1)
                    {
                        //console.log(i)
                        artists_1[item[i].Artists]=item[i].Column_3
                    }
                else if(item[i].mode==0)
                    {
                        artists_0[item[i].Artists]=item[i].Column_3
                    }
            }
            console.log(artists_0)
            console.log(artists_1)
            labels_1 = Object.keys(artists_1)
            var data_1 = []
            for (i in labels_1) {
                data_1.push(artists_1[labels_1[i]])
            }
            var data_0 = []
            labels_0 = Object.keys(artists_0)
            for (i in labels_0) {
                data_0.push(artists_0[labels_0[i]])
            }
            

            var ctx = canvas.getContext('2d');
            var config = {
                type: 'line',
                data: {
                    labels: labels_1,
                    datasets: [{
                        label: 'Mode 0',
                        data: data_1,
                        // backgroundColor: "#3e95cd"
                        fill: false,
                        borderColor: 'orange',
                        backgroundColor: 'transparent',
                       
                    },
                    {
                        label: 'mode 1',
                        data: data_0,
                        // backgroundColor: "#3e95cd"
                        fill: false,
                        borderColor: 'pink',
                        backgroundColor: 'transparent',
                       
                    }
                              ]
                },
                options: {
                    responsive: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                fontSize: 16,
                                fontFamily: "'Roboto', sans-serif",
                                fontColor: '#000',
                                fontStyle: '500'
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                fontSize: 16,
                                fontFamily: "'Roboto', sans-serif",
                                fontColor: '#000',
                                fontStyle: '500'
                            }
                        }]
                    }
                }
            };
            var chart = new Chart(ctx, config);
        }

if (op == '4') {
            var item = JSON.parse(value);
            //console.log(item)
            artists_0={}
            artists_1={}
            for(i in item){
                if(item[i].mode==1)
                    {
                        //console.log(i)
                        artists_1[item[i].Artists]=item[i].Column_3
                    }
                else if(item[i].mode==0)
                    {
                        artists_0[item[i].Artists]=item[i].Column_3
                    }
            }
            console.log(artists_0)
            console.log(artists_1)
            labels_1 = Object.keys(artists_1)
            var data_1 = []
            for (i in labels_1) {
                data_1.push(artists_1[labels_1[i]])
            }
            var data_0 = []
            labels_0 = Object.keys(artists_0)
            for (i in labels_0) {
                data_0.push(artists_0[labels_0[i]])
            }
            

            var ctx = canvas.getContext('2d');
            var config = {
                type: 'line',
                data: {
                    labels: labels_1,
                    datasets: [{
                        label: 'Mode 0',
                        data: data_1,
                        // backgroundColor: "#3e95cd"
                        fill: false,
                        borderColor: 'orange',
                        backgroundColor: 'transparent',
                       
                    },
                    {
                        label: 'mode 1',
                        data: data_0,
                        // backgroundColor: "#3e95cd"
                        fill: false,
                        borderColor: 'pink',
                        backgroundColor: 'transparent',
                       
                    }
                              ]
                },
                options: {
                    responsive: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                fontSize: 16,
                                fontFamily: "'Roboto', sans-serif",
                                fontColor: '#000',
                                fontStyle: '500'
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                fontSize: 16,
                                fontFamily: "'Roboto', sans-serif",
                                fontColor: '#000',
                                fontStyle: '500'
                            }
                        }]
                    }
                }
            };
            var chart = new Chart(ctx, config);
        }



    });

</script>
<!--    </script>-->

</html>
