
class Relatorio {
    //get quantidade da tabela remedioubs
    static getRelatorio(app, sql) {
        app.get("/relatorio/:ano", (req, res, next) => {
            var ano = req.params.ano;
            console.log(ano);
            var query = "select SUBSTRING(dataManifestacao , 4, 2)," +
                " count(tipo) from manifestacao where" +
                " SUBSTRING(dataManifestacao , 7, 4) = " + "'" + ano + "'" +
                " group by SUBSTRING(dataManifestacao , 4, 2)";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Impossivel montar relatorio' });
                }
            });
        });
    }
    //e agora?
    static getAllRelatorio(app, sql) {
        app.get("/relatorio", (req, res, next) => {
            console.log("chegou 1");
            sql.query("select * from paciente", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Relatorio nao encontrado' });
                }
            });
        });
    }

    static postRelatorio(app, sql) {
        app.post("/relatorio", (req, res, next) => {
            n
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO Relatorio (cns, dataNascimento, nome, endereco, senha, telefone, email, idUbs) VALUES('"
                + user.cns + "','" + user.dataNascimento + "','" + user.nome + "','" + user.endereco + "','"
                + user.senha + "','" + user.telefone + "','" + user.email + "','" + user.idUbs + "');";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Relatorio WHERE cns = '" + req.body.cns + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r);
                    return res.status(200).json(r);
                })
            });
        });
    }
}



module.exports = Relatorio;
