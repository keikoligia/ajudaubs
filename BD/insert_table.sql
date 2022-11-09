
/*Endereco
CargoArea
Horario
Prefeitura
TipoManifestacao
Remedio
Ubs
Paciente
Avaliacao
Funcionario
Disponibilidade
Consulta
Manifestacao
RemedioUbs

INSERT INTO Endereco (idEndereco, cep, rua, complemento, numero, bairro, municipio, estado) VALUES('770207452947129','13088652','Rua Amadeu Gardini','', 249,'Jardim Santana','Campinas','SP');

DELETE FROM Endereco WHERE idEndereco > 0;
DELETE FROM Endereco WHERE idEndereco = '770207452947129';

ALTER TABLE Endereco AUTO_INCREMENT = 1;
select * from Endereco;
INSERT INTO Endereco VALUES('012345678912345','13088652', 'Rua Amadeu Gardini', '249', '', 'Jardim Santana', 'Campinas', 'SP');
INSERT INTO Endereco VALUES('112345678912345','13042420', 'Rua Harley Salvador Bove', '470', '', 'Parque Jambeiro', 'Campinas', 'SP');
*/

drop table CargoArea
DELETE FROM CargoArea WHERE idCargoArea > 0;
ALTER TABLE CargoArea AUTO_INCREMENT = 1;
select * from CargoArea;
INSERT INTO CargoArea VALUES('Médico(a) Obstetra', 'Obstetrícia ');
INSERT INTO CargoArea VALUES('Secretário(a)', 'Adminstração ');

drop table Prefeitura
DELETE FROM Prefeitura WHERE idPrefeitura > 0;
ALTER TABLE Prefeitura AUTO_INCREMENT = 0;
select * from Prefeitura;
INSERT INTO Prefeitura VALUES('Campinas', 'SP', 'Campinas123', '08007727456', 'ouvidoria@campinas.sp.leg.br', 'https://portal.campinas.sp.gov.br/');
INSERT INTO Prefeitura VALUES('Valinhos', 'SP', 'Valinhos123', '08007777000', 'ouvidoria@valinhos.sp.leg.br', 'https://www.valinhos.sp.gov.br/');

drop table TipoManifestacao

DELETE FROM TipoManifestacao WHERE idTipoManifestacao != 0;
ALTER TABLE TipoManifestacao AUTO_INCREMENT = 1;
select * from TipoManifestacao;
INSERT INTO TipoManifestacao VALUES('DENÚNCIA', 'Escolha essa opção para demonstrar a sua insatisfação com um serviço público. Você pode fazer críticas, relatar ineficiência e irregularidades. Também se aplica aos casos de omissão na prestação um serviço público.');
INSERT INTO TipoManifestacao VALUES('DÚVIDA', 'Escolha essa opção para demonstrar a sua insatisfação com um serviço público. Você pode fazer críticas, relatar ineficiência e irregularidades. Também se aplica aos casos de omissão na prestação um serviço público.');
INSERT INTO TipoManifestacao VALUES('ELOGIO', 'Escolha essa opção se você foi bem atendido ou está satisfeito com o atendimento recebido e deseja compartilhar com a administração pública.');
INSERT INTO TipoManifestacao VALUES('SUGESTÃO', 'Escolha essa opção para solicitar a simplificação da prestação de um serviço público. Você poderá apresentar uma proposta de melhoria por meio deste formulário próprio.');

drop table Remedio

DELETE FROM Remedio WHERE idRemedio > 0;
ALTER TABLE Remedio AUTO_INCREMENT = 1;
select * from  Remedio;
INSERT INTO Remedio VALUES(null,'Metamizol', 'Dipirona', 'O metamizol é um analgésico não opioide comumente usado na medicina para tratar a dor. Assim como o paracetamol é mais usado para dores de cabeça, por exemplo, ou o ibuprofeno para dores com base na inflamação, o metamizol é usado para dores agudas.');

alter table Ubs
add column vinculo varchar(100) not null;

drop table Ubs
DELETE FROM Ubs WHERE cnes != '00000000001';
select * from Ubs;
pacienteINSERT INTO Ubs VALUES('2040670','Enfermeiro Luis Carlos Marcelino - (Parque São Quirino)', 
'Avenida Diogo Álvares, 1450 - Parque São Quirino - CEP 13088-221', 'ubs123', '1932567243', 
'Campinas', 'Segunda à sexta-feira, das 7h às 19h / Sábado, das 7h00 às 13h00', 'saude.cssaoquirino@campinas.sp.gov.br', 
-22.8622019,-47.0368772, 'https://lh5.googleusercontent.com/p/AF1QipN7H_EhdI2DwmANVen1hwDBmez-HZseRBjD8VOm=w203-h360-k-no', 'Distrito de Saúde Leste');
INSERT INTO Ubs VALUES('2023156','"Dr. Laerte de Moraes" - (Jardim Eulina)', 
'Rua Martin Luther King Júnior, 286 - Jardim Eulina - CEP 13063-580', 'ubs123', '1932430233', 
'Campinas', 'Segunda à sexta-feira, das 7h às 18h', ' saude.csjdeulina@campinas.sp.gov.br', 
-22.8928105,-47.1056446, 'https://lh5.googleusercontent.com/p/AF1QipMXtmbx01qe2IMgU0Ti60lixt4oGQjB35XqJppI=w203-h270-k-no', 'Distrito de Saúde Norte');

drop table Paciente

DELETE FROM Paciente WHERE cns = '112345678912345';
select * from Paciente;
select * from endereco;

INSERT INTO Paciente VALUES('012345678912345','08/05/2004','Fabricio Onofre Rezende de Camargo',
'Rua Amadeu Gardini, 249 - Jardim Santana, Campinas - SP - CEP 13088652', 'user123',  
'19994974618', 'fabricio.falcoon@gmail.com', '2040670');
INSERT INTO Paciente VALUES('112345678912345','2004-10-29','Ligia Keiko Carvalho', '112345678912345', 'Ligia123',  '19993710319', 'ligiakeiko@gmail.com', '00000000002');


drop table Avaliacao

DELETE FROM Avaliacao WHERE idAvaliacao != 0;
ALTER TABLE Avaliacao AUTO_INCREMENT = 1;
select * from Avaliacao;
INSERT INTO Avaliacao VALUES(null,'2040670', '012345678912345', 3);
INSERT INTO Avaliacao VALUES(null,'00000000002', '012345678912345', 2);
INSERT INTO Avaliacao VALUES(null,'00000000002', '112345678912345', 4);
INSERT INTO Avaliacao VALUES(null,'00000000001', '112345678912345', 2);


drop table Funcionario

DELETE FROM Funcionario WHERE cpf != '00000000000';
select * from Funcionario;
select * from CargoArea;

INSERT INTO Funcionario VALUES('00000000001','SP123456', 'Médico(a) Obstetra', 'Simone de Rezende', '2040670');
INSERT INTO Funcionario VALUES('00000000002', null, 14, 'Maria Paula', '00000000002', 14);
INSERT INTO Funcionario VALUES('00000000003', null, 2, 'Hercules Marques', '00000000002', 2);


drop table Horario
DELETE FROM Horario WHERE idHorario > 0;
ALTER TABLE Horario AUTO_INCREMENT = 1;
select * from Horario;
INSERT INTO Horario VALUES('Sexta-Feira', '13:00', '17:30', '15:00:00', '16:00:00', '00000000001');
INSERT INTO Horario VALUES(null,'Quinta-Feira', '10:00', '15:30', '12:00:00', '13:00:00');





drop table Disponibilidade
DELETE FROM Disponibilidade WHERE idDisponibilidade != 0;
ALTER TABLE Disponibilidade AUTO_INCREMENT = 1;
select * from Disponibilidade;
INSERT INTO Disponibilidade VALUES(null,'SP123456', '00000000001', 1, '2022-06-30', 'S');
INSERT INTO Disponibilidade VALUES(null,'SP123456', '00000000001', 2, '2022-06-30', 'S');
INSERT INTO Disponibilidade VALUES(null,'SP123456', '00000000001', 3, '2022-06-30', 'S');

drop table Consulta

DELETE FROM Consulta WHERE idConsulta != 0;
ALTER TABLE Consulta AUTO_INCREMENT = 1;
select * from Consulta;
INSERT INTO Consulta VALUES(null,'SP123456', '012345678912345', 4, 4, 'Acompanhamento da gestação');
INSERT INTO Consulta VALUES(null,'SP123456', '000000000000002', 1, 3, 'Teste de gravidez');

drop table Manifestacao

alter table Manifestacao
modify column dataManifestacao varchar(30) not null;

DELETE FROM Manifestacao WHERE idManifestacao != 0;
ALTER TABLE Manifestacao AUTO_INCREMENT = 1;
select * from Manifestacao;
INSERT INTO Manifestacao VALUES('1234ABCD','2040670', '012345678912345', 'DENÚNCIA', 'R', 
null,null, null, 'Demora demasiada na fila de espera do postinho', '05/06/2022');
INSERT INTO Manifestacao VALUES(null,'00000000002', '000000000000002', 4, 'R', 'Otimo atendimento aos pacientes', '2022-06-28', '01234567');

alter table RemedioUbs
modify column dataValidade varchar(30) not null;

drop table RemedioUbs
DELETE FROM RemedioUbs WHERE idRemedioUbs != 0;
ALTER TABLE RemedioUbs AUTO_INCREMENT = 1;
select * from RemedioUbs;
INSERT INTO RemedioUbs VALUES(null, 4, '2040670', 100, '10/09/2023', '05/10/2023');
select * from Remedio;


INSERT INTO RemedioUbs VALUES(null, 1, '00000000002', 50, '2023-09-10', '2022-05-10');
INSERT INTO Ubs VALUES('00000000001','Amadeu Mendes dos Santos', '012345678912345', 'ubs123', '1932461072', 1, 'Seg. a Sex. 6:00 às 18:00', ' saude.csjdsantamonica@campinas.sp.gov.br')

INSERT INTO ibge_plano VALUES ('TOTAL', '17,9', ' 40,1 ');
INSERT INTO ibge_plano VALUES ('Porto Velho', '22,1', ' 25,9 ');
INSERT INTO ibge_plano VALUES ('Rio Branco', '13,7', ' 12,1 ');
INSERT INTO ibge_plano VALUES ('Manaus', '23,1', ' 24,9 ');
INSERT INTO ibge_plano VALUES ('Boa Vista', '26,3', ' 11,9 ');
INSERT INTO ibge_plano VALUES ('Belém', '24,7', ' 33,1 ');
INSERT INTO ibge_plano VALUES ('Macapá', '*', ' 16,9 ');
INSERT INTO ibge_plano VALUES ('Palmas', '14,8', ' 28,2 ');
INSERT INTO ibge_plano VALUES ('São Luís', '12,0', ' 19,3 ');
INSERT INTO ibge_plano VALUES ('Teresina', '21,2', ' 30,1 ');
INSERT INTO ibge_plano VALUES ('Fortaleza', '15,1', ' 34,2 ');
INSERT INTO ibge_plano VALUES ('Natal', '17,2', ' 31,5 ');
INSERT INTO ibge_plano VALUES ('João Pessoa', '10,4', ' 29,9 ');
INSERT INTO ibge_plano VALUES ('Recife', '12,7', ' 41,3 ');
INSERT INTO ibge_plano VALUES ('Maceió', '*', ' 28,6 ');
INSERT INTO ibge_plano VALUES ('Aracaju', '8,7', ' 37,5 ');
INSERT INTO ibge_plano VALUES ('Salvador', '*', ' 38,2 ');
INSERT INTO ibge_plano VALUES ('Belo Horizonte', '*', ' 51,6 ');
INSERT INTO ibge_plano VALUES ('Vitória', '13,6', ' 54,9 ');
INSERT INTO ibge_plano VALUES ('Rio de Janeiro', '7,4', ' 43,4 ');
INSERT INTO ibge_plano VALUES ('São Paulo', '*', ' 45,7 ');
INSERT INTO ibge_plano VALUES ('Curitiba', '*', ' 48,9 ');
INSERT INTO ibge_plano VALUES ('Florianópolis', '*', ' 46,5 ');
INSERT INTO ibge_plano VALUES ('Porto Alegre', '*', ' 47,8 ');
INSERT INTO ibge_plano VALUES ('Campo Grande', '*', ' 38,4 ');
INSERT INTO ibge_plano VALUES ('Cuiabá', '*', ' 42,2 ');
INSERT INTO ibge_plano VALUES ('Goiânia', '12,3', '46');
INSERT INTO ibge_plano VALUES ('Brasília', 'null', ' 39,1 ');
/*
INSERT INTO ibge_exame  VALUES ('Rio Branco', '22.1');
INSERT INTO ibge_exame  VALUES ('Manaus', '13.7');
INSERT INTO ibge_exame  VALUES ('Boa Vista', '23.1');
INSERT INTO ibge_exame  VALUES ('Belém', '26.3');
INSERT INTO ibge_exame  VALUES ('Macapá', '24.7');
INSERT INTO ibge_exame  VALUES ('Palmas *', '*');
INSERT INTO ibge_exame  VALUES ('Săo Luís', '14.8');
INSERT INTO ibge_exame  VALUES ('Teresina', '12.0');
INSERT INTO ibge_exame  VALUES ('Fortaleza', '21.2');
INSERT INTO ibge_exame  VALUES ('Natal', '15.1');
INSERT INTO ibge_exame  VALUES ('Joăo Pessoa', '17.2');
INSERT INTO ibge_exame  VALUES ('Recife', '10.4');
INSERT INTO ibge_exame  VALUES ('Maceió', '12.7');
INSERT INTO ibge_exame  VALUES ('Aracaju *', '*');
INSERT INTO ibge_exame  VALUES ('Salvador', '8.7');
INSERT INTO ibge_exame  VALUES ('Belo Horizonte', '*');
INSERT INTO ibge_exame  VALUES ('Vitória *', '*');
INSERT INTO ibge_exame  VALUES ('Rio de Janeiro', '13.6');
INSERT INTO ibge_exame  VALUES ('Săo Paulo', '7.4');
INSERT INTO ibge_exame  VALUES ('Curitiba *', '*');
INSERT INTO ibge_exame  VALUES ('Florianópolis *', '*');
INSERT INTO ibge_exame  VALUES ('Porto Alegre', '*');
INSERT INTO ibge_exame  VALUES ('Campo Grande', '*');
INSERT INTO ibge_exame  VALUES ('Cuiabá *', '*');
INSERT INTO ibge_exame  VALUES ('Goiânia *', '*');
INSERT INTO ibge_exame  VALUES ('Brasília', '12.3');

INSERT INTO ibge_plano VALUES ('Porto Velho', ' 25,9 ');
INSERT INTO ibge_plano VALUES ('Rio Branco', ' 12,1 ');
INSERT INTO ibge_plano VALUES ('Manaus', ' 24,9 ');
INSERT INTO ibge_plano VALUES ('Boa Vista', ' 11,9 ');
INSERT INTO ibge_plano VALUES ('Belém', ' 33,1 ');
INSERT INTO ibge_plano VALUES ('Macapá', ' 16,9 ');
INSERT INTO ibge_plano VALUES ('Palmas', ' 28,2 ');
INSERT INTO ibge_plano VALUES ('São Luís', ' 19,3 ');
INSERT INTO ibge_plano VALUES ('Teresina', ' 30,1 ');
INSERT INTO ibge_plano VALUES ('Fortaleza', ' 34,2 ');
INSERT INTO ibge_plano VALUES ('Natal', ' 31,5 ');
INSERT INTO ibge_plano VALUES ('João Pessoa', ' 29,9 ');
INSERT INTO ibge_plano VALUES ('Recife', ' 41,3 ');
INSERT INTO ibge_plano VALUES ('Maceió', ' 28,6 ');
INSERT INTO ibge_plano VALUES ('Aracaju', ' 37,5 ');
INSERT INTO ibge_plano VALUES ('Salvador', ' 38,2 ');
INSERT INTO ibge_plano VALUES ('Belo Horizonte', ' 51,6 ');
INSERT INTO ibge_plano VALUES ('Vitória', ' 54,9 ');
INSERT INTO ibge_plano VALUES ('Rio de Janeiro', ' 43,4 ');
INSERT INTO ibge_plano VALUES ('São Paulo', ' 45,7 ');
INSERT INTO ibge_plano VALUES ('Curitiba', ' 48,9 ');
INSERT INTO ibge_plano VALUES ('Florianópolis', ' 46,5 ');
INSERT INTO ibge_plano VALUES ('Porto Alegre', ' 47,8 ');
INSERT INTO ibge_plano VALUES ('Campo Grande', ' 38,4 ');
INSERT INTO ibge_plano VALUES ('Cuiabá', ' 42,2 ');
INSERT INTO ibge_plano VALUES ('Goiânia', '46');
INSERT INTO ibge_plano VALUES ('Brasília', ' 39,1 ');
*/