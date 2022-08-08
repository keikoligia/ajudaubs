create table CargoArea( 
nomeCargo varchar(100) not null, 
nomeArea varchar(100) not null,
unique key keyCargoArea (nomeCargo, nomeArea)
);
select * from CargoArea;
drop table CargoArea;

create table Prefeitura(
municipio varchar(50) not null primary key,
estado char(2) not null,
senha varchar(30) not null,
foneOuvidoria varchar(20),
emailOuvidoria varchar(100),
site varchar(300) null
);
select * from Prefeitura;
drop table Prefeitura;


create table TipoManifestacao(
nome varchar(50) not null primary key,
descricao varchar(300) not null
);
select * from TipoManifestacao;
drop table TipoManifestacao;

create table Remedio(
idRemedio int primary key auto_increment,
nomeTecnico varchar(30) not null,
nomeComercial varchar(30) not null,
descricao varchar(300)
);
select * from Remedio;
drop table Remedio;

create table Ubs(
cnes char(11) primary key,
nome varchar(100) not null unique,
endereco varchar(200) not null,
senha varchar(30) not null,
telefone varchar(20) not null unique,
idPrefeitura varchar(50) not null,
horario varchar(200) not null,
email varchar(100) not null unique,
latitude double not null,
longitude double not null,
fotoUrl varchar(500) null,
constraint fkUbsPrefitura FOREIGN key (idPrefeitura) references Prefeitura (municipio) 
);
select * from Ubs;
drop table Ubs;


create table Paciente( 
cns char(15) primary key, 
dataNascimento varchar(30) not null, 
nome varchar(100) not null,
endereco varchar(200) not null,
senha varchar(30) not null,
telefone varchar(30) unique not null, 
email varchar(100) unique not null,
idUbs char(11) not null,
constraint fkPacienteUbs FOREIGN key (idUbs) references Ubs (cnes) 
);
select * from Paciente;
drop table Paciente;


create table Avaliacao(
idAvaliacao int primary key auto_increment,
idUbs char(11) not null, 
idPaciente char(15) not null,
avaliacao int not null,
unique key keyAvaliacao (idUbs, idPaciente),
constraint fkAvaliacaoUbs FOREIGN key (idUbs) references Ubs (cnes),
constraint fkAvaliacaoPaciente FOREIGN key (idPaciente) references Paciente (cns) 
);
select * from Avaliacao;
drop table Avaliacao;


create table Funcionario(
cpf char(11) primary key,
crm varchar(20) unique null,
cargo varchar(100) not null,
nome varchar(100) not null,
idUbs char(11) not null,
constraint fkFuncionarioCargoArea  FOREIGN key (cargo) references CargoArea (nomeCargo), 
constraint fkFuncionarioUbs   FOREIGN key (idUbs) references Ubs (cnes)
);
select * from Funcionario;
drop table Funcionario;


create table Horario(
dia varchar(30) not null,
inicioHorario time not null,
fimHorario time not null,      
incioAlmoco time not null,
fimAlmoco time not null,
idFuncionario char(11) not null,
unique key keyAvaliacao (dia, idFuncionario),
constraint fkAvaliacaoFuncionario FOREIGN key (idFuncionario) references Funcionario (cpf) 
);
select * from Horario;
drop table Horario;


create table Disponibilidade(
idDisponibilidade int primary key auto_increment,
idMedico varchar(20) not null,
idUbs char(11) not null,
bloco bool not null,
dataMarcada date not null,
disponivel char(1) not null,
constraint fkDisponibilidadeFuncionario FOREIGN key (idMedico) references Funcionario (crm),
constraint fkDisponibilidadeUbs FOREIGN key (idUbs) references Ubs (cnes)
);
select * from Disponibilidade;
drop table Disponibilidade;

create table Consulta( 
idConsulta int PRIMARY KEY auto_increment, 
idMedico varchar(20) not null, 
idPaciente char(15) not null,
area varchar(100) not null,
idDisponibilidade int not null,
descricao varchar(200) not null,            
constraint fkConsultaCargoArea  FOREIGN key (area) references CargoArea (nomeCargo), 
constraint fkConsultaPaciente   FOREIGN key (idPaciente) references Paciente (cns),
constraint fkConsultaMedico   FOREIGN key (idMedico) references Funcionario (crm),
constraint fkConsultaDisponibilidade   FOREIGN key (idDisponibilidade) references Disponibilidade (idDisponibilidade)
);
select * from Consulta;
drop table Consulta;


create table Manifestacao(
protocolo char(8) primary key,
idUbs char(11) null,
idPaciente char(15) null,
tipo varchar(50) not null,
status char(1) not null,
imagem1 blob null,
imagem2 blob null,
imagem3 blob null,
descricao varchar(500) null,
dataManifestacao varchar(30) not null,
constraint fkManifestacaoTipoManifestacao  FOREIGN key (tipo) references TipoManifestacao (nome), 
constraint fkManifestacaoPaciente   FOREIGN key (idPaciente) references Paciente (cns),
constraint fkManifestacaoUbs  FOREIGN key (idUbs) references Ubs (cnes)
);
select * from Manifestacao;
drop table Manifestacao;

create table RemedioUbs(
idRemedioUbs int primary key auto_increment,
idRemedio int not null,
idUbs char(11) not null,
quantidade int not null,
dataValidade varchar(30) not null,
dataLote varchar(30) not null,
constraint fkRemedioUbsRemedio FOREIGN key (idRemedio) references Remedio (idRemedio), 
constraint fkRemedioUbsUbs   FOREIGN key (idUbs) references Ubs (cnes)
);
select * from RemedioUbs;
drop table RemedioUbs;




