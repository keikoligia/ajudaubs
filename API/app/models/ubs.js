
class Ubs {

    static getUbs(app, sql) {
        app.get("/ubs/:id", (req, res, next) => {
            var cnes = req.params.id;
            console.log(cnes);
            var query = "SELECT * FROM Ubs WHERE cnes =" + "'" + cnes + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Ubs nao encontrada' });
                }
            });
        });
    }

    static getAllUbs(app, sql) {
        app.get("/ubs", (req, res, next) => {
            sql.query("select * from ubs", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Nenhuma ubs encontrada' });
                }
            });
        });
    }

    static postUbs(app, sql) {
        app.post("/ubs", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO ubs (cnes, nome, endereco, senha, telefone, idPrefeitura, horario, email, latitude, longitude, fotoUrl) VALUES('"
                + user.cnes + "','" + user.nome + "','" + user.endereco + "','" + user.senha + "','" + user.telefone + "','"
                + user.idPrefeitura + "','" + user.horario + "','" + user.email + "','" + user.latitude + "','"
                + user.longitude + "','" + user.fotoUrl + "');";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM ubs WHERE cnes = '" + req.body.cnes + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r);
                    return res.status(200).json(r);
                })
            });
        });
    }
}

module.exports = Ubs;
