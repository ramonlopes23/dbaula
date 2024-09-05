USE bancoaula
CREATE TABLE disciplina(
	cod_disciplina INT NOT NULL PRIMARY KEY auto_increment,
	nome VARCHAR(100) NOT NULL UNIQUE
	
);

ALTER TABLE disciplina ADD cargahoraria INT NOT NULL; 


CREATE TABLE alunofatec(
	ra_aluno INT NOT NULL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	data_nasc DATE NOT NULL,
	cpf VARCHAR(11) not null UNIQUE,
	telefone VARCHAR(20) NOT NULL UNIQUE,
	endereco VARCHAR (255) NOT NULL
	);

DESCRIBE disciplina;
DROP TABLE disciplina;

DESCRIBE disciplina;


CREATE TABLE cursa(
	cod_disciplina INT NOT NULL,
	cod_aluno INT NOT NULL,
	datainicio DATE NOT NULL,
	datafim DATE NOT NULL,
	PRIMARY KEY (cod_disciplina,ra_aluno, datainicio),
	FOREIGN KEY (cod_disciplina) REFERENCES disciplina (cod_disciplina),
	FOREIGN KEY (ra_aluno) REFERENCES alunofatec (ra_aluno)
	
);
ALTER TABLE cursa CHANGE datainicio data_inicio DATE NOT NULL;
ALTER TABLE cursa CHANGE ra_aluno cod_aluno INT NOT NULL;

CONSTRAINT pk_cursa FOREIGN KEY (cod_disciplina, ra_aluno,data_inicio ); --é uma chave primaria composta
CONSTRAINT fk_cursa_disc FOREIGN KEY (cod_disciplina) REFERENCES disciplina (cod_disciplina)
CONSTRAINT fk_cursa_aluno FOREIGN KEY (cod_aluno) REFERENCES alunofatec (ra_aluno)

DESCRIBE cursa;

USE bancoaula;

SELECT * FROM alunofatec;

INSERT INTO disciplina (cod_disciplina, nome, cargahoraria)
VALUES (1, 'analise e desenvolvimento de sistemas',4);

DELETE FROM disciplina
WHERE cod_disciplina = 2;

ALTER TABLE alunofatec CHANGE nome nome_aluno VARCHAR (100) NOT NULL;

DESCRIBE alunofatec;

INSERT INTO alunofatec (ra_aluno, nome_aluno, data_nasc, cpf, telefone, endereco)
VALUES (1, 'Ramon Lopes de Camargo', 15-04-2001, '11111111111', 11111111111, 'rua das orquideas');

UPDATE alunofatec
SET data_nasc = "2001-04-15"
WHERE ra_aluno = 1;

CREATE TABLE aluno2 LIKE alunofatec;
INSERT INTO aluno2 SELECT * FROM alunofatec;
SELECT * FROM aluno2;


