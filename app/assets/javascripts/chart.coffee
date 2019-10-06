window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    barNum = gon.growth
    labels = new Array(barNum)
    for i in [0...barNum]
        labels[i] = 'data' + i
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            datasets: [{
                yAxisID: 'y-axis-1',
                label: '：身長(cm)　　　',
                data: gon.height,
                type: 'line',
                borderColor : "rgba(254,97,132,0.8)",
                pointBackgroundColor : "rgba(254,97,132,0.8)",
                fill: false,},
              {
                yAxisID: "y-axis-2",
                label: '：体重(kg)',
                data: gon.weight,
                type: 'line',
                borderColor : "rgba(54,164,235,0.8)",
                backgroundColor : "rgba(54,164,235,0.5)",
                fill: false,
            }],
            labels: gon.date
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    id: "y-axis-1",
                    type: "linear",
                    position: "left",
                    ticks: {
                        max: 120,
                        min: 30,
                        stepSize: 20
                    },
                }, {
                    id: "y-axis-2",
                    type: "linear",
                    position: "right",
                    ticks: {
                        max: 30,
                        min: 5,
                        stepSize: 5
                    },
                }]
            }
        }
    })
