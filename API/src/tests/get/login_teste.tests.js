const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
chai.use(chaiHttp);

//Testando se o login do paciente 0...4 funciona
it('Retorna os dados do paciente com cns 0...4 todos em string', (done) => {
    chai.request('http://localhost:3000')
        .get('/paciente/000000000000004')
        .end((err, res) => {
            res.should.have.status(200);
            res.should.be.json;
            res.body.should.be.a('array');
            res.body[0].should.have.property('cns').and.to.be.a('string');
            res.body[0].should.have.property('dataNascimento').and.to.be.a('string');
            res.body[0].should.have.property('nome').and.to.be.a('string');
            res.body[0].should.have.property('endereco').and.to.be.a('string');
            res.body[0].should.have.property('senha').and.to.be.a('string');
            res.body[0].should.have.property('telefone').and.to.be.a('string');
            res.body[0].should.have.property('email').and.to.be.a('string');
            res.body[0].should.have.property('idUbs').and.to.be.a('string');
            done();
        });
});

it('Retorna mensagem de not found se entrar com id em formato errado', (done) => {
    chai.request('http://localhost:3000')
        .get("/paciente/'" + 000000000000004 + "'")
        .end((err, res) => {
            res.should.have.status(404);
            res.should.be.json;
            //res.body.should.be.a('error');
            res.body[0].should.have.property('error');
            done();
        });
});

//Testando se o login do paciente 0...4 funciona
it('Retorna todos os pacientes', (done) => {
    chai.request('http://localhost:3000')
        .get('/paciente')
        .end((err, res) => {
            res.should.have.status(200);
            res.should.be.json;
            res.body.should.be.a('array'); // Now we expected a array of objects
            //res.body[0].should.have.property('title');// Check the propertys of the first object
            //res.body[0].should.have.property('body'); // Check the propertys of the first object
            done();
        });
});