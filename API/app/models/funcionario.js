
class Funcionario {

    // Requisões: LOGIN
    static getFuncionario(app, sql) {
        app.get("/funcionario/:id", (req, res, next) => {
            var cpfFuncionario = req.params.id;
            console.log(cpfFuncionario);
            var query = "SELECT * FROM Funcionario WHERE cpf =" + "'" + cpfFuncionario + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Funcionario nao encontrado' });
                }
            });
        });
    }
    static getAllFuncionario(app, sql) {
        app.get("/funcionario", (req, res, next) => {
            console.log("chegou 1");
            sql.query("select * from funcionario", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Funcionario nao encontrado' });
                }
            });
        });
    }

    static postFuncionario(app, sql) {
        app.post("/funcionario", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            console.log(user)
            var query = "INSERT INTO Funcionario (cpf, crm, cargo, nome, idUbs) VALUES('" + user.cpf + "','" + user.crm + "','" + user.cargo + "','" + user.nome + "','" + user.idUbs + "');";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Funcionario WHERE cpf = '" + req.body.cpf + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r);
                    return res.status(200).json(r);
                })
            });
        });
    }
}



module.exports = Funcionario;
