
class Dados {

    static makePlot(app) {
        app.get("/dados", (req, res, next) => {
            var capitalLabels = players.map(function (d) {
                return d.Capital;
            });
            var infoData = players.map(function (d) {
                return +d.Info;
            });

            var chart = new Chart('chart', {
                type: "horizontalBar",
                options: {
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    }
                },
                data: {
                    labels: capitalLabels,
                    datasets: [
                        {
                            data: infoData
                        }
                    ]
                }
            });

            d3
                .csv("./API/extras/ibge.csv")
                .then(makeChart);
        });
    }
}

module.exports = Dados;
