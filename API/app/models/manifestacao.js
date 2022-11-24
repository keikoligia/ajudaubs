
class Manifestacao {
    static getManifestacao(app, sql) {
        app.get("/manifestacao/:id", (req, res, next) => {
            var protocolo = req.params.id;
            console.log(protocolo);
            var query = "SELECT * FROM manifestacao WHERE protocolo =" + "'" + protocolo + "';";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Manifestacao nao encontrada' });
                }
            });
        });
    }

    static getAllManifestacoes(app, sql) {
        app.get("/manifestacao", (req, res, next) => {
            sql.query("select * from manifestacao", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Manifestações nao encontradas' });
                }
            });
        });
    }

    static postManifestacao(app, sql) {
        app.post("/manifestacao", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao

            if (user.idPaciente == '') {
                user.idPaciente = null;
            } if (user.imagem1 == '') {
                user.imagem1 = null;
            } if (user.imagem2 == '') {
                user.imagem2 = null;
            } if (user.imagem3 == '') {
                user.imagem3 = null;
            }


            var query = "INSERT INTO manifestacao VALUES ('" + user.protocolo + "','" + user.codigoAcesso + "','" + user.idUbs
                + "','" + user.idPaciente + "','" + user.tipo + "','" + user.status + "'," + user.imagem1 + "," + user.imagem1
                + "," + user.imagem3 + ",'" + user.descricao + "','" + user.dataManifestacao + "');";

            var queryNull = "INSERT INTO manifestacao VALUES ('" + user.protocolo + "','" + user.codigoAcesso + "','" + user.idUbs
                + "'," + user.idPaciente + ",'" + user.tipo + "','" + user.status + "'," + user.imagem1 + "," + user.imagem1 + ","
                + user.imagem3 + ",'" + user.descricao + "','" + user.dataManifestacao + "');";
            console.log(user);
            console.log(query);

            sql.query((user.idPaciente == null) ? queryNull : query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM manifestacao WHERE protocolo = '" + req.body.protocolo + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log(r);
                    return res.status(200).json(r);
                })
            });
        });
    }
}



module.exports = Manifestacao;
