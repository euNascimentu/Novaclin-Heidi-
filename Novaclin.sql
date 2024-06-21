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

ALTER TABLE paciente
ADD estado CHAR (2) NOT NULL;

INSERT INTO paciente
VALUES (
1,'Donald','12342312521','13991182342','2003-06-21 02:48:11','donaldvivido@gmail.com','Rua Tolentino Viera','546','Casa','Santos','11236489',null,'SP'
2,'Margarida','3549871322','13997586238','2004-04-11 03:57:23','margaridaraquel@gmail.com','Rua Joselina Almeida','321','Apto','São Vicente','11956132',null,'SP'
3,'Patinhas','7654652310','13996546885','2000-08-29 09:02:32','patinhasmolenga@gmail.com','Avenida Carijós','1514','Casa','Santos','11989762',null,'SP'
4,'Huguinho','3274516451','15987231450','2001-05-31 13:15:22','hugoministro@gmail.com','Rua Leonardo Nunes','212','Casa','Cubatão','11354124',null,'SP'
5,'Luizinho','2316754860','21921356895','1987-11-01 19:02:55','luizfarias@gmail.com','Avenida Guarani','111','Casa','Praia Grande','11856478',null,'SP'
6,'Zezinho','85245697312','39850222365','1969-12-22 17:00:00','zezinhotonho@gmail.com','Rua Maracanã','244','apto','São João del Rei','11365484',null,'MG'
7,'Mickey','32165487987','11988235486','2000-03-08 11:35:24','mickeymouse@gmail.com','Avenida Joselina Ferreira','12','Casa','Rio de Janeiro','11587698',null,'RJ'
8,'Minie','25489614235','12977856234','2005-04-13 12:25:52','miniemouse@gmail.com','Avenida Tupi','22','','','','',null,'SP'
)