const { expect } = require('chai');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
chai.use(chaiHttp);

describe('Model manifestação', function () {
    it('Insere manifestação', (done) => {
        let manifestacao =
        {
            protocolo: "IeAjLhBt2022",
            codigoAcesso: "tlyHhYdx",
            idUbs: "2023156",
            idPaciente: null,
            tipo: "ELOGIO",
            status: "PENDENTE",
            imagem1: null,
            imagem2: null,
            imagem3: null,
            descricao: "Atendimento muito eficiente.",
            dataManifestacao: "30/10/2022"
        }
        chai.request('http://localhost:3000')
            .post('/manifestacao')
            .send(manifestacao)
            .end((err, res) => {
                expect(res).to.have.status(200);
                expect(res.body).to.be.a('array');
                res.body[0].should.have.deep.property('protocolo', 'IeAjLhBt2022');
                res.body[0].should.have.deep.property('codigoAcesso', 'tlyHhYdx');
                done();
            });
    });

    it('Resgata manifestação', (done) => {
        chai.request('http://localhost:3000')
            .get('/manifestacao/IeAjLhBt2022')
            .end((err, res) => {
                res.should.have.status(200);
                res.should.be.json;
                res.body.should.be.a('array');
                res.body[0].should.have.deep.property('protocolo', 'IeAjLhBt2022');
                res.body.length.should.be.eql(1);
                done();
            });
    });

    it('Resgata manifestação por usuário', (done) => {
        chai.request('http://localhost:3000')
            .get('/manifestacao/usuario/000000000000004')
            .end((err, res) => {
                res.should.have.status(200);
                res.should.be.json;
                res.body.should.be.a('array');
                res.body[0].should.have.deep.property('idPaciente', '000000000000004');
                //res.body.length.should.be.eql(1);
                done();
            });
    });
});
