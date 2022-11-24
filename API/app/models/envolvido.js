
class Envolvido {
    // Requisões: LOGIN
    static getEnvolvido(app, sql) {
        app.get("/Envolvido/:id", (req, res, next) => {
            var idEnvolvido = req.params.id;
            console.log(idEnvolvido);
            var query = "SELECT * FROM Envolvido WHERE idEnvolvido =" + "'" + idEnvolvido + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Envolvido nao encontrado' });
                }
            });
        });
    }

    static getAllEnvolvido(app, sql) {
        app.get("/Envolvido", (req, res, next) => {
            var query = "SELECT * FROM Envolvido";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Envolvido nao encontrado' });
                }
            });
        });
    }

    static postEnvolvido(app, sql) {
        app.post("/Envolvido", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO Envolvido (nomeEnvolvido, cargoEnvolvido, idManifestacao) "
                + "VALUES('" + user.nomeEnvolvido + "','" + user.cargoEnvolvido + "','" + user.idManifestacao + "')";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Envolvido WHERE nomeEnvolvido = '" + user.nomeEnvolvido + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r[0]);
                    return res.status(200).json(r[0]);
                })
            });
        });
    }

}



module.exports = Envolvido;
