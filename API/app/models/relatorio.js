
class Relatorio {
    //get quantidade da tabela remedioubs
    static getRelatorioManifestacao(app, sql) {
        app.get("/relatorio/:ano", (req, res, next) => {
            var ano = req.params.ano;
            console.log(ano);
            var query = "select SUBSTRING(dataManifestacao , 4, 2) as 'mes', tipo," +
                " count(tipo) as 'qtd manifestacao' from manifestacao where" +
                " SUBSTRING(dataManifestacao , 7, 4) = " + "'" + ano + "'" +
                " group by SUBSTRING(dataManifestacao , 4, 2), tipo";
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

    //get todos os meses de manifestacao 
    static getAllRelatorioManifestacao(app, sql) {
        app.get("/relatorio", (req, res, next) => {
            var query = "select SUBSTRING(dataManifestacao , 4, 2) as 'mes', tipo," +
                " count(tipo) as 'qtd manifestacao' from manifestacao" +
                " group by SUBSTRING(dataManifestacao , 4, 2), tipo";
            console.log(query);
            sql.query(query, (err, result,) => {
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

    //pegar ubs mais bem avaliada 
    static getRankUbs(app, sql) {
        app.get("/rank", (req, res, next) => {
            var query = "select AVG(a.avaliacao) as 'media', u.nome, u.cnes from avaliacao a, ubs u" +
                " where a.idUbs = u.cnes" +
                " group by u.nome";
            console.log(query);
            sql.query(query, (err, result,) => {
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
}

module.exports = Relatorio;
