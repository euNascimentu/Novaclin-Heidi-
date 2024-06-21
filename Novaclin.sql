USE novaclin

SHOW TABLES

DROP TABLE paciente

SELECT * FROM paciente
/*Adicionando tabelas*/
CREATE TABLE recepcionista(
idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeRecepcionista VARCHAR(50) NOT NULL,
loginRecepcionsita VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
celular CHAR(11)  NULL,
cpf CHAR(11) NOT NULL
);

CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cel CHAR(11) NOT NULL,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL,
logradouro VARCHAR (30) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) NULL,
cidade VARCHAR(20) NOT NULL,
cep CHAR(8) NULL,
observações VARCHAR(100)
);
 
CREATE TABLE especialidade(
idEspecialidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeEspecialidade VARCHAR(30) NOT NULL
);
 
 
CREATE TABLE medico(
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IdEspecialidade INT NOT NULL,
nome VARCHAR(50) NOT NULL,
crm CHAR(8) NOT NULL,
login VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
CONSTRAINT Fk_MedicoEspecialidade FOREIGN KEY(idEspecialidade)
REFERENCES especialidade(idEspecialidade)
);
 
CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idRecepcionista INT NOT NULL,
idMedico INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
sintomas VARCHAR(200) NULL,
prescricao VARCHAR(200) NULL,
CONSTRAINT Fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT Fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES recepcionista(idRecepcionista),
CONSTRAINT Fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES medico(idMedico)
);
 
CREATE TABLE exame(
idExame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
dataHoraExame DATETIME NOT NULL,
nomeExame VARCHAR(30) NOT NULL,
statusExame VARCHAR(10) NOT NULL,
resultado VARCHAR(200) NULL,
dataRetiradaExane DATETIME NULL,
dataPrevisaoEntrega DATETIME NULL,
CONSTRAINT Fk_exameconsulta FOREIGN KEY(idConsulta)
REFERENCES consulta(idConsulta)
);

/*Guia de códigos*/

ALTER TABLE paciente
ADD estado CHAR (2) NOT NULL;

DELETE FROM ...
WHERE ... = .

SELECT * FROM Consulta

SHOW tables

/*Inserindo massa de dados as tabelas*/

INSERT INTO paciente
VALUES 
(1,'Donald','12342312521','13991182342','2003-06-21 02:48:11','donaldvivido@gmail.com','Rua Tolentino Viera','546','Casa','Santos','11236489',null,'SP'),
(2,'Margarida','3549871322','13997586238','2004-04-11 03:57:23','margaridaraquel@gmail.com','Rua Joselina Almeida','321','Apto','São Vicente','11956132',null,'SP'),
(3,'Patinhas','7654652310','13996546885','2000-08-29 09:02:32','patinhasmolenga@gmail.com','Avenida Carijós','1514','Casa','Santos','11989762',null,'SP'),
(4,'Huguinho','3274516451','15987231450','2001-05-31 13:15:22','hugoministro@gmail.com','Rua Leonardo Nunes','212','Casa','Cubatão','11354124',null,'SP'),
(5,'Luizinho','2316754860','21921356895','1987-11-01 19:02:55','luizfarias@gmail.com','Avenida Guarani','111','Casa','Praia Grande','11856478',null,'SP'),
(6,'Zezinho','85245697312','39850222365','1969-12-22 17:00:00','zezinhotonho@gmail.com','Rua Maracanã','244','apto','São João del Rei','11365484',null,'MG'),
(7,'Mickey','32165487987','11988235486','2000-03-08 11:35:24','mickeymouse@gmail.com','Avenida Joselina Ferreira','12','Casa','Rio de Janeiro','11587698',null,'RJ'),
(8,'Minie','25489614235','12977856234','2005-04-13 12:25:52','miniemouse@gmail.com','Avenida Tupi','22','Apto','São Paulo','11235687',null,'SP');

INSERT INTO recepcionista (nomeRecepcionista,loginRecepcionsita,senha,celular,cpf)
VALUES 
('Chico Bento','chicobento.senaclin','546895','13991874321','56732568911'),
('Franjinha','franjinha.senaclin','753961','13997215478','56987456231'),
('Cebolinha','cebolinha.senaclin','236598','13998662356','13564897125');

INSERT INTO especialidade (nomeEspecialidade)
VALUES 
('Cardiologista'),
('Otorrinolaringologista'),
('Clínico Geral'),
('Gastroenterologista'),
('Otorpedista');

INSERT INTO medico
VALUES 
(1,1,'Pardal','765544SP','pardal_med.senaclin','231564'),
(2,5,'Mônica','768880SP','monica_med.senaclin','987564'),
(3,3,'Zé Carioca','165544RJ','zeca_med.senaclin','132168'),
(4,4,'Magali','265544SP',',magali_med.senaclin','323646'),
(5,2,'Horácio','365544MG','horacio_med.senaclin','454687');


/*Inserindo consultas*/

INSERT INTO consulta (idPaciente,idMedico,idRecepcionista, dataHoraConsulta, sintomas, prescricao)
VALUES 
(1, 1, 1, '2024-07-22 14:30','Fortes dores de cabeça, nausea e enjoô', '5ml de amoxilina de 8 em 8h e 1 comprimindo Dipirona 100mlg de 4 em 4h'),
(2,2,1, '2024-06-23 13:00','Consulta de rotina',NULL),
(3,4,2, '2024-06-29 16:00', 'Consulta de rotina',NULL),
(7,5,2, '2024-07-02 11:00', 'Dores abdominais e dores de cabeça','Dipirona de 4 em 4h'),
(8,5,2, '2024-07-05 13:30', 'Consulta de rotina', NULL),
(3,1,1, '2024-07-05 15:00', 'Retorno', 'Exame RaioX do Peitoral'),
(3,2,1, '2024-07-10 14:00', 'Retorno', 'Exame RaioX do Crânio');

INSERT INTO exame
VALUES 
(22,6, '2024-08-10 13:00', 'RaioX', 'Em espera',);