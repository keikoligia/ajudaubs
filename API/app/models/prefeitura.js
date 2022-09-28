
class Prefeitura {
    static getPrefeitura(app, sql) {
        app.get("/prefeitura/:id", (req, res, next) => {
            var municipio = req.params.id;
            console.log(municipio);
            var query = "SELECT * FROM Prefeitura WHERE municipio = " + "'" + municipio + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Prefeitura nao encontrada' });
                }
            });
        });
    }

    static getAllPrefeitura(app, sql) {
        app.get("/prefeitura", (req, res, next) => {
            console.log("chegou 1");
            sql.query("select * from Prefeitura", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Prefeitura nao encontrado' });
                }
            });
        });
    }

    static postPrefeitura(app, sql) {
        app.post("/prefeitura", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO Prefeitura values ('"
                + user.municipio + "','" + user.estado + "','" + user.senha + "','" + user.foneOuvidoria + "','"
                + user.emailOuvidoria + "','" + user.site + "');";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Prefeitura WHERE municipio = '" + req.body.municipio + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r);
                    return res.status(200).json(r);
                })
            });

        });
    }
}



module.exports = Prefeitura;
