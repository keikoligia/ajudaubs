const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
chai.use(chaiHttp);

//Testando se o login do paciente 0...4 funciona
it('Test GET All Posts', (done) => {
    chai.request('http://localhost:3000')
        .get('/paciente/000000000000004')
        .end((err, res) => {
            res.should.have.status(200);
            res.should.be.json;
            res.body.should.be.a('array'); // Now we expected a array of objects
            //res.body[0].should.have.property('title');// Check the propertys of the first object
            //res.body[0].should.have.property('body'); // Check the propertys of the first object
            done();
        });
});