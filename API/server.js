const express = require("express");
// const bodyParser = require("body-parser"); /* deprecated */
const cors = require("cors");

const app = express();

const sql = require("./app/models/db.js");

const Paciente = require("./app/models/paciente.js");
const Endereco = require("./app/models/endereco.js");
const Ubs = require("./app/models/ubs.js");

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

//const api_ob = new UserApiClass(http);

// Requisições PACIENTE
Paciente.getPaciente(app, sql);
Paciente.getAllPaciente(app, sql);
Paciente.postPaciente(app, sql);


// Requisições PACIENTE
Endereco.getEndereco(app, sql);
Endereco.getAllEndereco(app, sql);
Endereco.postEndereco(app, sql);

// Requisições UBS
Ubs.getUbs(app, sql);
Ubs.getAllUbs(app, sql);


require("./app/routes/tutorial.routes.js")(app);


// set port, listen for requests
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});