
class Horario {
    static getHorario(app, sql) {
        app.get("/horario/:id", (req, res, next) => {
            var idHorario = req.params.id;
            console.log(cnsHorario);
            var query = "SELECT * FROM Horario WHERE idHorario = " + idHorario;
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Horario nao encontrado' });
                }
            });
        });
    }

    static getHorarioFuncionario(app, sql) {
        app.get("/horario/:idFuncionario", (req, res, next) => {
            var idFuncionario = req.params.idFuncionario;
            console.log(cnsHorario);
            var query = "SELECT * FROM Horario WHERE idFuncionario = " + idFuncionario;
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Horario nao encontrado' });
                }
            });
        });
    }

    static getAllHorario(app, sql) {
        app.get("/horario", (req, res, next) => {
            sql.query("select * from Horario", (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Horario nao encontrado' });
                }
            });
        });
    }

    static postHorario(app, sql) {
        app.post("/horario", (req, res, next) => {
            var user = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO horario values ('"
                + user.dia + "','" + user.inicioHorario + "','" + user.fimHorario + "','" + user.incioAlmoco + "','"
                + user.fimAlmoco + "','" + user.idFuncionario + "');";
            console.log(user);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Horario WHERE idFuncionario = '" + req.body.idFuncionario + "'"
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r);
                    return res.status(200).json(r);
                })
            });
        });
    }
}



module.exports = Horario;
