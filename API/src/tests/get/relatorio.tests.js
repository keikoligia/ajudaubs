const { expect } = require('chai');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
chai.use(chaiHttp);

//fazer um for pra checar todas as posicoes e comparar elas

describe('Model relatório', function () {

    it('Ranquea corretamente', (done) => {
        chai.request('http://localhost:3000')
            .get('/rank')
            .end((err, res) => {
                let body_length = res.body.length;
                console.log(body_length)
                let i = 1
                res.should.have.status(200);
                res.body.length.should.be.eql(body_length);//qtd de ubs no rank
                res.should.be.json;
                res.body.should.be.a('array');
                while (i < body_length) {
                    res.body[i - 1].should.have.property('media') >= res.body[i].should.have.property('media');
                    i++;
                }

                done();
            });
    });

    it('Retorna quantidade de manif./mes', (done) => {
        chai.request('http://localhost:3000')
            .get('/quantidade')
            .end((err, res) => {
                res.should.have.status(200);
                res.should.be.json;
                res.body.should.be.a('array');
                var body_length = res.body.length;
                for (var i = 0; i < body_length; i++) {
                    res.body[i].should.have.property('mes') > 0;
                    res.body[i].should.have.property('qtd manifestacao').not.eq(null);
                }
                done();
            });
    });

    it('Retorna quantidade de todas as manif.', (done) => {
        chai.request('http://localhost:3000')
            .get('/relatorio')
            .end((err, res) => {
                res.should.have.status(200);
                res.should.be.json;
                let body_length = res.body.length;
                res.body.should.be.a('array');
                expect(res.body)
                    .and.to.have.property(0)
                    .that.includes.all.keys(['mes', 'tipo', 'qtd manifestacao'])
                for (let i = 0; i < body_length; i++) {
                    res.body[i].should.have.property('mes') > 0;
                    res.body[i].should.have.property('tipo').not.eq(null);
                    res.body[i].should.have.property('qtd manifestacao').not.eq(null);
                }
                done();
            });
    });

    it('Retorna quantidade de todas as manif. de 2022', (done) => {
        chai.request('http://localhost:3000')
            .get('/relatorio/2022')
            .end((err, res) => {
                res.should.have.status(200);
                res.should.be.json;
                expect(res.body)
                    .and.to.have.property(0)
                    .that.includes.all.keys(['mes', 'tipo', 'qtd manifestacao'])
                let body_length = res.body.length;
                res.body.should.be.a('array');
                for (let i = 0; i < body_length; i++) {
                    res.body[i].should.have.property('mes') > 0;
                    res.body[i].should.have.property('tipo').not.eq(null);
                    res.body[i].should.have.property('qtd manifestacao').not.eq(null);
                }
                done();
            });
    });

});