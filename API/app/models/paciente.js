
class Paciente {
    static getPaciente(app, sql) {
        app.get("/paciente/:id", (req, res, next) => {
            var cnsPaciente = req.params.id;
            console.log(cnsPaciente);
            var query = "SELECT * FROM Paciente WHERE cns =" + "'" + cnsPaciente + "' or email =" + "'" + cnsPaciente + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Paciente nao encontrado' });
                }
            });
        });
    }

    static getAllPaciente(app, sql) {
        app.get("/paciente", (req, res, next) => {
            console.log("chegou 1");
            sql.query("select * from paciente", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Paciente nao encontrado' });
                }
            });
        });
    }

    static postPaciente(app, sql) {
        app.post("/paciente", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO Paciente values ('"
                + user.cns + "','" + user.dataNascimento + "','" + user.nome + "','" + user.endereco + "','"
                + user.senha + "','" + user.telefone + "','" + user.email + "','" + user.idUbs + "');";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Paciente WHERE cns = '" + req.body.cns + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r);
                    return res.status(200).json(r);
                })
            });
        });
    }
}



module.exports = Paciente;
