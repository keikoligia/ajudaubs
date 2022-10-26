
class CargoArea {
    total_result = {}
    static getCargoArea(app, sql) {
        app.get("/cargoarea/:nomeCargo", (req, res, next) => {
            var nomeCargo = req.params.nomeCargo;
            console.log(nomeCargo);
            var query1 = "select * from cargoarea where nomeCargo = '" + nomeCargo + "'";

            sql.query(query1, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Impossivel achar cargo' });
                }
            });
        });
    }

    static getAllCargoArea(app, sql) {
        app.get("/cargoarea", (req, res, next) => {
            var query = "select * from cargoarea"
            console.log(query);
            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Cargo nao encontrado' });
                }
            });
        });
    }
}

module.exports = CargoArea;
