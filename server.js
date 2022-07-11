const express = require("express");
// const bodyParser = require("body-parser"); /* deprecated */
const cors = require("cors");

const app = express();

const sql = require("./app/models/db.js");

var corsOptions = {
  origin: "http://localhost:8081"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(express.json()); /* bodyParser.json() is deprecated */

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true })); /* bodyParser.urlencoded() is deprecated */

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Bem vindo ao AjudaUBS." });
});

app.get("/pacientes", (req, res, next) => {
  console.log("chegou 1");
  sql.query("select * from paciente", (err, result,) => {
    if(result && result.length)
    {
      console.log(result);
      return res.status(200).json(result);
    }
    else
    {
      return res.status(404).json({error: 'Paciente nao encontrado'});
    }
  });
});

app.get("/paciente/:id", (req, res, next) => {
  var cnsPaciente = req.params.id;
  console.log(cnsPaciente);
  var query = "SELECT * FROM Paciente WHERE cns =" + "'" + cnsPaciente  + "'";
  console.log(query);

  sql.query(query, (err, result,) => {
    if(result && result.length)
    {
      console.log(result);
      return res.status(200).json(result);
    }
    else
    {
      return res.status(404).json({error: 'Paciente nao encontrado'});
    }
  });
});

app.get("/endereco/:id", (req, res, next) => {
  var idEndereco = req.params.id;
  console.log(idEndereco);
  var query = "SELECT * FROM Endereco WHERE idEndereco =" + "'" + idEndereco  + "'";
  console.log(query);

  sql.query(query, (err, result,) => {
    if(result && result.length)
    {
      console.log(result);
      return res.status(200).json(result);
    }
    else
    {
      return res.status(404).json({error: 'Endereco nao encontrado'});
    }
  });
});

app.post("/endereco", (req, res, next) => {
  var user = req.body; // pega as informacoes da requisicao
  var query = "INSERT INTO Endereco (idEndereco, cep, rua, numero, bairro, municipio, estado) VALUES('" + user.idEndereco + "','" + user.cep + "','" + user.rua + "','" + user.numero + "','" + user.bairro + "','" + user.municipio + "','" + user.estado + "')";
  console.log(user);
  console.log(query);

  sql.query(query, function (error, result, fields){
    sql.on('error', function(err){
      console.log("ERRO NO MYSQL", err);
    });
    var query2 = "SELECT * FROM Endereco WHERE idEndereco = " + result.insertId
    console.log(query2);
    sql.query(query2, function(e, r, f){
      console.log("final " + r[0]);
      return res.status(200).json(r[0]);
    })
  });
});

app.post("/paciente", (req, res, next) => {
  var user = req.body; // pega as informacoes da requisicao
  var query = "INSERT INTO Paciente (cns, dataNascimento, nome, endereco, senha, telefone, email, idUbs) VALUES('" + user.cns + "','" + user.dataNascimento + "','" + user.nome + "','" + user.endereco + "','" + user.senha + "','" + user.telefone + "','" + user.email + "','" + user.idUbs + "');";
  console.log(user);
  console.log(query);

  sql.query(query, function (error, result, fields){
    sql.on('error', function(err){
      console.log("ERRO NO MYSQL", err);
    });
    var query2 = "SELECT * FROM Paciente WHERE cns = '" + req.body.cns + "'"
    console.log(query2);
    sql.query(query2, function(e, r, f){
      console.log("final " + r[0]);
      return res.status(200).json(r[0]);
    })
  });
});

//login?
app.get("/paciente/:id", (req, res, next) => {
  var cnsPaciente = req.params.id;
  console.log(cnsPaciente);
  var query = "SELECT * FROM Paciente WHERE cns =" + "'" + cnsPaciente  + "'";
  console.log(query);

  sql.query(query, (err, result,) => {
    if(result && result.length)
    {
      console.log(result);
      return res.status(200).json(result);
    }
    else
    {
      return res.status(404).json({error: 'Paciente nao encontrado'});
    }
  });
});

require("./app/routes/tutorial.routes.js")(app);

// set port, listen for requests
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});