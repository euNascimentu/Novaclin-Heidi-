/*ATIVIDADE 1*/
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

SELECT * FROM Medico

SHOW tables

/*Inserindo massa de dados as tabelas*/
/*ATIVIDADE 2*/

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


/*questão 5- Inserir de forma explícita uma consulta para cada médico
Dados conforme abaixo, demais dados livres. Atenção para colocar
datas de consultas posteriores a data de hoje.*/
INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
VALUES 
(1, 1, 1, '2024-06-25 10:00:00', 'Febre', 'Repouso'),
(2, 1, 2, '2024-06-26 11:00:00', 'Dor no joelho', 'Anti-inflamatório'),
(3, 1, 3, '2024-06-27 12:00:00', 'Dor abdominal', 'Exames'),
(7, 2, 4, '2024-06-28 13:00:00', 'Dor de estômago', 'Dieta'),
(8, 2, 5, '2024-06-29 14:00:00', 'Dor de ouvido', 'Medicação');

/*Inserir mais duas consultas ao Patinhas*/
INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
VALUES 
(3, 1, 1, '2024-06-30 15:00:00', 'Dor no peito', 'Eletrocardiograma'),
(3, 1, 2, '2024-07-01 16:00:00', 'Dor nas costas', 'Raio-X coluna');

/*Inserir um exame para cada consulta do Patinhas criada no item anterior */
INSERT INTO exame (idConsulta, dataHoraExame, nomeExame, statusExame)
VALUES 
(3, '2024-06-30 15:30:00', 'Eletrocardiograma', 'Pendente'),
(5, '2024-07-01 16:30:00', 'Raio-X Coluna', 'Pendente');

/*Remarcar (Atualizar) a consulta do Donald para a mesma data porém, 2hs mais tarde.*/
UPDATE consulta
SET dataHoraConsulta = DATE_ADD(dataHoraConsulta, INTERVAL 2 HOUR)
WHERE idConsulta = 1;

/*-A Minie mudou de endereço mas não mudou de cidade (logradouro, numero e
complemento). Realize a alteração dos dados.*/
UPDATE paciente
SET logradouro = 'nova rua', numero = '456', complemento = 'ap10'
WHERE nome = 'Minie';

/*O Mickey mudou o celular, realize a alteração.*/
UPDATE paciente
SET cel = '999888777'
WHERE nome = 'Mickey';

/*O Patinhas não poderá comparecer na consulta com o Ze Carioca. Realize a exclusão da
mesma no sistema. Foi possível? Justifique.*/
DELETE FROM consulta
WHERE idPaciente = 3 AND idMedico = 3;
/*motivo do erro*/
/*Esta operação pode falhar devido a uma restrição de chave estrangeira. A consulta do Patinhas com Zé Carioca pode estar referenciada em outras tabelas (por exemplo, na tabela exame através da chave estrangeira idConsulta). Antes de excluir, seria necessário remover as dependências nesses registros relacionados*/

/*Realize a exclusão da Dr Mônica da tabela Medico. Foi possível? Justifique.*/
DELETE FROM medico
WHERE nome = 'Mônica';
/*Não é possível excluir a médica Mônica diretamente devido a restrições de chave estrangeira. Ela pode estar associada a consultas na tabela consulta ou a exames na tabela exame. Para excluir, primeiro seria necessário remover todas as dependências relacionadas a ela nessas tabelas.*/

/*Exibir a data de todas as consultas em ordem cronológica, da que está mais próxima para a
que está mais longe.*/
SELECT dataHoraConsulta
FROM consulta
ORDER BY dataHoraConsulta;

/*Exibir todos os dados da tabela médico.*/
SELECT * FROM medico;

/*Exibir apenas as cidades em que a clínica possui pacientes, em ordem alfabética.*/
SELECT DISTINCT cidade
FROM paciente
ORDER BY cidade;

/*Exibir nome, celular e e-mail de todos os pacientes da clínica, em ordem alfabética.*/
SELECT nome, cel, email
FROM paciente
ORDER BY nome;

/*Atualizar apenas o CRM do Dr.Pardal que foi cadastrado errado no sistema.*/
UPDATE medico
SET crm = '765544SP'
WHERE nome = 'Pardal';

/*Resetar a senha de todos os médicos do sistema para o padrão "DOCTOR".*/
UPDATE medico
SET senha = 'DOCTOR';

/*Exibir apenas o nome do médico e seu CRM, dos médicos registrados em SP, tudo isto em
ordem alfabética.*/
SELECT nome, crm
FROM medico
WHERE crm LIKE '%SP%'
ORDER BY nome;

/*Exibir nome e celular de todos os pacientes que vivem em Santos e possuem nome
iniciando com a letra P.*/
SELECT nome, cel
FROM paciente
WHERE cidade = 'Santos' AND nome LIKE 'P%'
ORDER BY nome;


/*Exibir o nome, logradouro, numero e cidade de todos os pacientes que moram em
casa, em ordem alfabética.*/
SELECT nome, logradouro, numero, cidade
FROM paciente
WHERE logradouro LIKE '%casa%'
ORDER BY nome;

/*ATIVIDADE 3*/

/*1- Buscar nome do médico, nome da especialidade, e crm de todos os médicos cuja especialidade seja “Cardiologista”*/
 
SELECT m.nome AS nome_medico, e.nomeEspecialidade AS especialidade, m.crm
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE e.nomeEspecialidade = 'Cardiologista';
 
/*2- Buscar quantos pacientes a clínica possui por cidade.*/
 
SELECT cidade, COUNT(*) AS num_pacientes
FROM paciente
GROUP BY cidade;
 
/*3- Buscar a data de todas as consultas, nome do médico e o nome do paciente, em ordem cronológica.*/
 
SELECT c.dataHoraConsulta, m.nome AS nome_medico, p.nome AS nome_paciente
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN paciente p ON c.idPaciente = p.idPaciente
ORDER BY c.dataHoraConsulta;
 
/*4- Buscar o nome do paciente, celular, email, e a data da consulta de todos os pacientes com consulta marcada, desde que vivam em Santos.*/
 
SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
JOIN consulta c ON p.idPaciente = c.idPaciente
WHERE p.cidade = 'Santos';
 
/*5- Buscar todos os pacientes que tenham com a letra "P" no nome. */
 
SELECT *
FROM paciente
WHERE nome LIKE '%P%';
 
/*6- Buscar o nome do médico, a data da consulta, o nome do paciente e a especialidade do médico de todas as consultas de determinado dia (escolhido por você), em ordem alfabética.*/
 
SELECT m.nome AS nome_medico, c.dataHoraConsulta, p.nome AS nome_paciente, e.nomeEspecialidade AS especialidade
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN paciente p ON c.idPaciente = p.idPaciente
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE DATE(c.dataHoraConsulta) = '2024-06-30'
ORDER BY m.nome;
 
/*7- Buscar o nome dos médicos e sua especialidade, apenas dos médicos com CRM de SP.*/
 
SELECT m.nome AS nome_medico, e.nomeEspecialidade AS especialidade
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE m.crm LIKE '%SP%';
 
 
/*8- Buscar a data da consulta que está mais longe na clínica. */
 
SELECT MAX(dataHoraConsulta) AS data_mais_longe
FROM consulta;
 
/*9- Buscar quantos médicos a clínica possui por especialidade.*/
 
SELECT e.nomeEspecialidade AS especialidade, COUNT(*) AS num_medicos
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;
 
 
/*10- Buscar o nome, celular e email de todos os pacientes que começam com a letra “D” em ordem alfabética.*/
 
SELECT nome, cel, email
FROM paciente
WHERE nome LIKE 'D%'
ORDER BY nome;
 
/*11- Buscar todos os exames, bem como quem foi o médico que solicitou e a data do exame, em ordem cronológica (por data). */
 
SELECT nomeExame, m.nome AS medico_solicitante, ex.dataHoraExame
FROM exame ex
JOIN consulta c ON ex.idConsulta = c.idConsulta
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY ex.dataHoraExame;
 
/*12- Buscar o nome do médico, o crm e a data da consulta, de todos os médicos, ainda que não possuam consultas.*/
 
SELECT m.nome AS nome_medico, m.crm, c.dataHoraConsulta
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
ORDER BY m.nome;
 
/*13-Buscar o nome de todos os pacientes, celular, email e data da consulta em ordem alfabética. Trazer os pacientes ainda que não possuam consultas.*/
 
SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
LEFT JOIN consulta c ON p.idPaciente = c.idPaciente
ORDER BY p.nome;
 
/*14- Buscar o nome de todos os pacientes, logradouro, número e complemento apenas dos moradores que moram em São Paulo, em ordem alfabética.*/
 
SELECT nome, logradouro, numero, complemento
FROM paciente
WHERE cidade = 'São Paulo'
ORDER BY nome;
 
/*15- Buscar a data de todas as consultas, o nome do recepcionista que marcou, o nome do
paciente, o nome do médico, a especialidade do médico e o celular do paciente em ordem
cronológica invertida.*/
 
SELECT c.dataHoraConsulta, nomeRecepcionista AS nome_recepcionista, p.nome AS nome_paciente, m.nome AS nome_medico, e.nomeEspecialidade AS especialidade_medico, p.cel AS celular_paciente
FROM consulta c
JOIN recepcionista rec ON c.idRecepcionista = rec.idRecepcionista
JOIN paciente p ON c.idPaciente = p.idPaciente
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY c.dataHoraConsulta DESC;
 
/*Desafio - É possível realizar? Justifique:*/
/*Sim, é possível realizar essa consulta. Ela envolve múltiplas junções (joins) entre várias tabelas (consulta, recepcionista, paciente, medico e especialidade), onde os relacionamentos são bem definidos através de chaves estrangeiras. A ordenação é feita de forma decrescente pela coluna dataHoraConsulta.*/
 
/*Relatório a) - Quantas consultas cada médico realizou na clínica:*/
SELECT m.nome AS nome_medico, COUNT(c.idConsulta) AS num_consultas
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
GROUP BY m.nome;
 
/*Relatório b) - Quantas consultas foram realizadas por especialidade:*/
SELECT e.nomeEspecialidade AS especialidade_medico, COUNT(c.idConsulta) AS num_consultas
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;

/*ATIVIDADE 4*/

/*Guias*/
DROP VIEW vw_qtde_consultas_por_especialidade
SELECT * FROM vw_qtde_consultas_por_especialidade

/*1º Questão*/
CREATE VIEW tb_NomeEcontato
AS 
SELECT nome AS 'Nome Paciente', cel AS 'Telefone Cel' FROM paciente 
ORDER BY nome,cel ASC

SELECT * FROM tb_NomeEcontato

/*2º Questão*/
CREATE VIEW vw_qtde_consultas_por_especialidade AS
SELECT e.nomeEspecialidade AS especialidade, COUNT(c.idConsulta) AS quantidade_consultas
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;
 
SELECT * FROM vw_qtde_consultas_por_especialidade;


