const { expect } = require('chai');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
chai.use(chaiHttp);

describe('Model Remédio UBS', function () {
    it('Insere remédio UBS', (done) => {
        let remedio_ubs = {
            cnes: "2040670",
            nome: "Enfermeiro Luis Carlos Marcelino - (Parque São Quirino)",
            endereco: "Avenida Diogo Álvares, 1450 - Parque São Quirino - CEP 13088-221",
            senha: "ubs123",
            telefone: "1932567243",
            idPrefeitura: "Campinas",
            horario: "Segunda à sexta-feira, das 7h às 19h / Sábado, das 7h00 às 13h00",
            email: "saude.cssaoquirino@campinas.sp.gov.br",
            latitude: -22.8622019,
            longitude: -47.0368772,
            fotoUrl: "https://lh5.googleusercontent.com/p/AF1QipN7H_EhdI2DwmANVen1hwDBmez-HZseRBjD8VOm=w203-h360-k-no",
            vinculo: "Distrito de Saúde Leste"
        }

        chai.request('http://localhost:3000')
            .post('/remedioubs/')
            .send(manifestacao)
            .end((err, res) => {
                expect(res).to.have.status(200);
                expect(res.body).to.be.a('array');
                res.body[0].should.have.deep.property('cnes', '2040670');
                expect(remedio_ubs).to.have.all.keys('cnes', 'nome', 'endereco', 'senha', 'telefone', 'idPrefeitura', 'horario', 'email', 'latitude', 'longitude', 'fotoUrl', 'vinculo');

                done();
            });
    });

    it('Resgata remédio UBS pelo nome', (done) => {
        chai.request('http://localhost:3000')
            .get('/manifestacao/Dipirona')
            .end((err, res) => {
                res.should.have.status(200);
                res.should.be.json;
                res.body.should.be.a('array');
                res.body[0].should.have.deep.property('idRemedio', 'Dipirona');
                expect(res).to.have.all.keys('protocolo', 'codigoAcesso', 'idUbs', 'idPaciente', 'tipo', 'status', 'imagem1', 'imagem2', 'imagem3', 'descricao', 'dataManifestacao');
                done();
            });
    });

    it('Resgata remédio UBS pelo idRemedio', (done) => {
        chai.request('http://localhost:3000')
            .get('/manifestacao/usuario/000000000000004')
            .end((err, res) => {
                res.should.have.status(200);
                res.should.be.json;
                res.body.should.be.a('array');
                res.body[0].should.have.deep.property('idRemedio', 'Dipirona');
                expect(res).to.have.all.keys('protocolo', 'codigoAcesso', 'idUbs', 'idPaciente', 'tipo', 'status', 'imagem1', 'imagem2', 'imagem3', 'descricao', 'dataManifestacao');
                done();
            });
    });
});
