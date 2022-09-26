
class Endereco {
    // Requisões: LOGIN
    static getEndereco(app, sql) {
        app.get("/endereco/:id", (req, res, next) => {
            var idEndereco = req.params.id;
            console.log(idEndereco);
            var query = "SELECT * FROM Endereco WHERE idEndereco =" + "'" + idEndereco + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Endereco nao encontrado' });
                }
            });
        });
    }

    static getAllEndereco(app, sql) {
        app.get("/endereco", (req, res, next) => {
            var query = "SELECT * FROM Endereco";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Endereco nao encontrado' });
                }
            });
        });
    }

    static postEndereco(app, sql) {
        app.post("/endereco", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO Endereco (idEndereco, cep, rua, complemento, numero, bairro, municipio, estado) "
                + "VALUES('" + user.idEndereco + "','" + user.cep + "','" + user.rua + "','" + user.complemento + "'," + user.numero + ",'" + user.bairro + "','" + user.municipio + "','" + user.estado + "')";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Endereco WHERE idEndereco = " + user.idEndereco
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r[0]);
                    return res.status(200).json(r[0]);
                })
            });
        });
    }

}



module.exports = Endereco;
