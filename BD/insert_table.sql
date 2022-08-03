
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
RemedioUbs*/

DELETE FROM Endereco WHERE idEndereco > 0;
DELETE FROM Endereco WHERE idEndereco = '000000000000000';

ALTER TABLE Endereco AUTO_INCREMENT = 1;
select * from Endereco;
INSERT INTO Endereco VALUES('012345678912345','13088652', 'Rua Amadeu Gardini', '249', '', 'Jardim Santana', 'Campinas', 'SP');
INSERT INTO Endereco VALUES('112345678912345','13042420', 'Rua Harley Salvador Bove', '470', '', 'Parque Jambeiro', 'Campinas', 'SP');

drop table CargoArea

DELETE FROM CargoArea WHERE idCargoArea > 0;
ALTER TABLE CargoArea AUTO_INCREMENT = 1;
select * from CargoArea;
INSERT INTO CargoArea VALUES(null,'Médico(a) Obstetra', 'Obstetrícia ');
INSERT INTO CargoArea VALUES(null,'Secretário(a)', 'Adminstração ');

drop table Horario

DELETE FROM Horario WHERE idHorario > 0;
ALTER TABLE Horario AUTO_INCREMENT = 1;
select * from Horario;
INSERT INTO Horario VALUES(null,'Sexta-Feira', '13:00', '17:30', '15:00:00', '16:00:00');
INSERT INTO Horario VALUES(null,'Quinta-Feira', '10:00', '15:30', '12:00:00', '13:00:00');

drop table Prefeitura

DELETE FROM Prefeitura WHERE idPrefeitura > 0;
ALTER TABLE Prefeitura AUTO_INCREMENT = 0;
select * from Prefeitura;
INSERT INTO Prefeitura VALUES('Campinas', 'SP', 'Campinas123', '08007727456', 'ouvidoria@campinas.sp.leg.br');
INSERT INTO Prefeitura VALUES('Valinhos', 'SP', 'Valinhos123', '08007777000', 'ouvidoria@valinhos.sp.leg.br');

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

drop table Ubs

DELETE FROM Ubs WHERE cnes = '00000000001';
select * from Ubs;
INSERT INTO Ubs VALUES('00000000001','Amadeu Mendes dos Santos', '012345678912345', 'ubs123', '1932461072', 'Campinas', 'Seg. a Sex. 6:00 às 18:00', ' saude.csjdsantamonica@campinas.sp.gov.br');
INSERT INTO Ubs VALUES('00000000002','Julio Mesquita', '112345678912345', 'ubs123', '19994974618', 'Valinhos', 'Seg. a Sex. 6:00 às 18:00', ' saude.csjdaurelia@campinas.sp.gov.br');

drop table Paciente

DELETE FROM Paciente WHERE cns = '112345678912345';
select * from Paciente;
select * from endereco;

INSERT INTO Paciente VALUES('012345678912345','2004-05-08','Fabricio Onofre','012345678912345', 'Fabricio123',  '19994974618', 'fabricio.falcoon@gmail.com', '00000000001');
INSERT INTO Paciente VALUES('112345678912345','2004-10-29','Ligia Keiko Carvalho', '112345678912345', 'Ligia123',  '19993710319', 'ligiakeiko@gmail.com', '00000000002');


drop table Avaliacao

DELETE FROM Avaliacao WHERE idAvaliacao != 0;
ALTER TABLE Avaliacao AUTO_INCREMENT = 1;
select * from Avaliacao;
INSERT INTO Avaliacao VALUES(null,'00000000001', '012345678912345', 3);
INSERT INTO Avaliacao VALUES(null,'00000000002', '012345678912345', 2);
INSERT INTO Avaliacao VALUES(null,'00000000002', '112345678912345', 4);
INSERT INTO Avaliacao VALUES(null,'00000000001', '112345678912345', 2);


drop table Funcionario

DELETE FROM Funcionario WHERE cpf != '00000000000';
select * from Funcionario;
INSERT INTO Funcionario VALUES('00000000001','SP123456', 4, 'Simone de Rezende', '00000000001', 4);
INSERT INTO Funcionario VALUES('00000000002', null, 14, 'Maria Paula', '00000000002', 14);
INSERT INTO Funcionario VALUES('00000000003', null, 2, 'Hercules Marques', '00000000002', 2);

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

DELETE FROM Manifestacao WHERE idManifestacao != 0;
ALTER TABLE Manifestacao AUTO_INCREMENT = 1;
select * from Manifestacao;
INSERT INTO Manifestacao VALUES(null,'00000000001', '012345678912345', 'DENÚNCIA', 'R', 'Demora demasiada na fila de espera do postinho', '2022-05-27', '12345678');
INSERT INTO Manifestacao VALUES(null,'00000000002', '000000000000002', 4, 'R', 'Otimo atendimento aos pacientes', '2022-06-28', '01234567');

drop table RemedioUbs
DELETE FROM RemedioUbs WHERE idRemedioUbs != 0;
ALTER TABLE RemedioUbs AUTO_INCREMENT = 1;
select * from RemedioUbs;
INSERT INTO RemedioUbs VALUES(null, 4, '00000000001', 100, '2023-09-10', '2022-05-10');

INSERT INTO RemedioUbs VALUES(null, 1, '00000000002', 50, '2023-09-10', '2022-05-10');
INSERT INTO Ubs VALUES('00000000001','Amadeu Mendes dos Santos', '012345678912345', 'ubs123', '1932461072', 1, 'Seg. a Sex. 6:00 às 18:00', ' saude.csjdsantamonica@campinas.sp.gov.br')
