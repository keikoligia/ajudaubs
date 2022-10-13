
class Remedio {
    static getRemedio(app, sql) {
        app.get("/remedio/:nome", (req, res, next) => {
            var nomeRemedio = req.params.nome;
            console.log(nomeRemedio);
            var query = "SELECT * FROM Remedio WHERE nomeComercial =" + "'" + nomeRemedio + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Remedio nao encontrado' });
                }
            });
        });
    }

    static getAllRemedio(app, sql) {
        app.get("/remedio", (req, res, next) => {
            console.log("chegou 1");
            sql.query("select * from remedio", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Remedio nao encontrado' });
                }
            });
        });
    }

    static postRemedio(app, sql) {
        app.post("/remedio", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO Remedio (idRemedio, nomeTecnico, nomeComercial, descricao) VALUES('" + user.idRemedio + "','"
                + user.nomeTecnico + "','" + user.nomeComercial + "','" + user.descricao + "');";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Remedio WHERE idRemedio = '" + req.body.idRemedio + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r);
                    return res.status(200).json(r);
                })
            });
        });
    }
}



module.exports = Remedio;
