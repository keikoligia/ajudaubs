
class Remedio_Ubs {
    // Requisões: LOGIN
    static getRemedio_Ubs(app, sql) {
        app.get("/remedioubs/:id", (req, res, next) => {
            var idRemedioUbs = req.params.id;
            console.log(idRemedioUbs);
            var query = "SELECT * FROM RemedioUbs WHERE idRemedioUbs =" + "'" + idRemedioUbs + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'RemedioUbs nao encontrado' });
                }
            });
        });
    }
    static getAllRemedio_Ubs(app, sql) {
        app.get("/remediosubs", (req, res, next) => {
            console.log("chegou 1");
            sql.query("select * from RemedioUbs", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Remedio_Ubs nao encontrado' });
                }
            });
        });
    }

    static postRemedio_Ubs(app, sql) {
        app.post("/remedioubs", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO RemedioUbs (idRemedioUbs, idRemedio, idUbs, quantidade, dataValidade, dataLote) VALUES('" + user.idRemedioUbs + "','"
                + user.idRemedio + "','" + user.idUbs + "','" + user.quantidade + "','" + user.dataValidade + "','" + user.dataLote + "');";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM RemedioUbs WHERE idRemedioUbs = '" + req.body.idRemedioUbs + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r);
                    return res.status(200).json(r);
                })
            });
        });
    }
}

module.exports = Remedio_Ubs;
