
class Ubs {


    // Requisões: LOGIN
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
}



module.exports = Ubs;
