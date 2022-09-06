const express = require("express");
// const bodyParser = require("body-parser"); /* deprecated */
const cors = require("cors");

const app = express();

const sql = require("./app/models/db.js");

const Paciente = require("./app/models/paciente.js");
const Funcionario = require("./app/models/funcionario.js");
const Endereco = require("./app/models/endereco.js");
const Ubs = require("./app/models/ubs.js");
const RemedioUbs = require("./app/models/remedio_ubs.js");
const Remedio = require("./app/models/remedio.js");
const Relatorio = require("./app/models/relatorio.js");
const Manifestacao = require("./app/models/manifestacao.js");

var corsOptions = {
  origin: "http://localhost:8081"
};

app.use(cors());

// parse requests of content-type - application/json
app.use(express.json()); /* bodyParser.json() is deprecated */

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true })); /* bodyParser.urlencoded() is deprecated */

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Bem vindo ao AjudaUBS." });
});

// Requisições PACIENTE
Paciente.getPaciente(app, sql);
Paciente.getAllPaciente(app, sql);
Paciente.postPaciente(app, sql);

// Requisições Endereço
Endereco.getEndereco(app, sql);
Endereco.getAllEndereco(app, sql);
Endereco.postEndereco(app, sql);

// Requisições UBS
Ubs.getUbs(app, sql);
Ubs.getAllUbs(app, sql);
Ubs.postUbs(app, sql);

//Requisições Funcionario
Funcionario.getFuncionario(app, sql);
Funcionario.getAllFuncionario(app, sql);
Funcionario.postFuncionario(app, sql);

//Requisições Remedio
Remedio.getAllRemedio(app, sql);
Remedio.getRemedio(app, sql);
Remedio.postRemedio(app, sql);

//Requisições RemedioUbs
RemedioUbs.getAllRemedio_Ubs(app, sql);
RemedioUbs.getRemedio_Ubs(app, sql);
RemedioUbs.postRemedio_Ubs(app, sql);

//Requisicoes Relatorio
Relatorio.getRelatorioManifestacao(app, sql);
Relatorio.getAllRelatorioManifestacao(app, sql);
Relatorio.getRankUbs(app, sql);
Relatorio.getQtdManifestacoes(app, sql);

Manifestacao.getManifestacao(app, sql);
Manifestacao.getAllManifestacoes(app, sql);
Manifestacao.postManifestacao(app, sql);

require("./app/routes/tutorial.routes.js")(app);

// set port, listen for requests
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});