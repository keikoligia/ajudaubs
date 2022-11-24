
class Consulta {

    static getAllConsulta(app, sql) {
        app.get("/consulta", (req, res, next) => {

            var query = "select * from consulta";
            console.log(query)
            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Consulta nao encontrada' });
                }
            });
        });
    }

    static getConsultaMedico(app, sql) {
        app.get("/consulta/:idUbs/:idMedico/:data", (req, res, next) => {
            var idUbs = req.params.idUbs;
            var idMedico = req.params.idMedico;
            var data = req.params.data;
            //console.log(idUbs);
            //console.log(idMedico);
            //console.log(data);
            var query = "select * from consulta where idUbs = '" + idUbs + "' and idMedico = '" + idMedico + "' and dataMarcada = '" + data + "';";
            console.log(query)
            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Consulta nao encontrada' });
                }
            });
        });
    }

    static getConsulta(app, sql) {
        app.get("/consulta", (req, res, next) => {
            var idUbs = req.body.idUbs;
            var area = req.body.area;

            var query = "select distinct co.dataMarcada, co.bloco from funcionario f, consulta co " +
                "where co.idMedico in (select distinct f.crm  from cargoarea c, ubs ub, funcionario f " +
                "where c.nomeArea  = '" + area + "' and f.idUbs = '" + idUbs + "' )" +
                "group by co.bloco, co.dataMarcada";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Consulta nao encontrada' });
                }
            });
        });
    }

    static getConsultaId(app, sql) {
        app.get("/consulta/:id", (req, res, next) => {
            var idConsulta = req.params.id;

            var query = "select * from consulta where idConsulta = '" + idConsulta + "'";
            console.log(query);

            sql.query(query, (err, result,) => {
                if (result && result.length) {
                    console.log(result);
                    return res.status(200).json(result);
                }
                else {
                    return res.status(404).json({ error: 'Consulta nao encontrada' });
                }
            });
        });
    }

    static postConsulta(app, sql) {
        app.post("/consulta", (req, res, next) => {
            var consulta = req.body; // pega as informacoes da requisicao
            var query = "INSERT INTO Consulta "
                + "VALUES(" + null + ",'" + consulta.idUbs + "','" + consulta.idMedico + "','" + consulta.idPaciente + "','" + consulta.area + "','"
                + consulta.dataMarcada + "'," + consulta.bloco + ",'" + consulta.descricao + "')";
            console.log(consulta);
            console.log(query);

            sql.query(query, function (error, result, fields) {
                sql.on('error', function (err) {
                    console.log("ERRO NO MYSQL", err);
                });
                var query2 = "SELECT * FROM Consulta WHERE idConsulta = " + consulta.idConsulta
                console.log(query2);
                sql.query(query2, function (e, r, f) {
                    console.log("final " + r[0]);
                    return res.status(200).json(r[0]);
                })
            });
        });
    }

}



module.exports = Consulta;
