const { expect } = require('chai');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
chai.use(chaiHttp);

describe('Model paciente', function(){
    it('Retorna status 201 ao inserir paciente', (done) => {
        let paciente = {cns: '000000000000004',
            dataNascimento: '30/10/2022',
            nome: 'Luiz Inácio da Silva',
            endereco: 'Rua Partido do Trabalhador, 13',
            senha: 'lula123',
            telefone: '11981086713',
            email: 'lula@gmail.com',
            idUbs: '2040670'
        }
        chai.request('http://localhost:3000')
        .post('/paciente')
        .send(paciente)
        .end((err, res) => {
            expect(res).to.have.status(200);
            expect(res.body).to.be.a('array');
            res.body[0].should.have.deep.property('cns', '000000000000004');
            expect(paciente).to.have.all.keys('cns', 'dataNascimento', 'nome', 'endereco', 'senha', 'telefone', 'email', 'idUbs');
            done();
        });
    });

    it('Retorna 200 ao resgatar paciente', (done) => {
        chai.request('http://localhost:3000')
            .get('/paciente/000000000000004')
            .end((err, res) => {
                res.should.have.status(200);
                res.body.length.should.be.eql(1);
                res.should.be.json;
                res.body.should.be.a('array');
                res.body[0].should.have.deep.property('cns', '000000000000004');
                done();
            });
    });
});
