USE clinicamedica;



CREATE TABLE consulta(
	numero INT,
	datea_consulta DATE,
	diagnostico VARCHAR(200),
	crm_medico VARCHAR(10),
	cod_paciente VARCHAR(15),
	cod_especialidade INT,
	cod_convenio INT,
	CONSTRAINT pk_consulta PRIMARY KEY (numero),
	CONSTRAINT fk_consulta_medico FOREIGN KEY (crm_medico) REFERENCES medico(crm),
	CONSTRAINT fk_consulta_paciente FOREIGN KEY (cod_paciente) REFERENCES paciente(cpf),
	CONSTRAINT fk_consulta_especialidade FOREIGN KEY (cod_especialidade) REFERENCES especialidade (cod_e),
	CONSTRAINT fk_atende_convenio FOREIGN KEY (cod_convenio) REFERENCES convenio(cod_c)

);

DESCRIBE atende;
DESCRIBE convenio;
DESCRIBE consulta;
DESCRIBE paciente;
DESCRIBE especialidade;

CREATE TABLE atende (
    numero INT,
    data_consulta DATE,
    diagnostico VARCHAR(200),
    crm_medico VARCHAR(10),
    cod_paciente VARCHAR(15),
    cod_especialidade INT,
    cod_convenio INT,
    CONSTRAINT pk_atende PRIMARY KEY (numero),
    CONSTRAINT fk_atende_medico FOREIGN KEY (crm_medico) REFERENCES medico(crm),
    CONSTRAINT fk_atende_paciente FOREIGN KEY (cod_paciente) REFERENCES paciente(cpf),
    CONSTRAINT fk_atende_especialidade FOREIGN KEY (cod_especialidade) REFERENCES especialidade(cod_e),
    CONSTRAINT fk_atende_convenio2 FOREIGN KEY (cod_convenio) REFERENCES convenio(cod_c)
);


create table contem (
	cod_atende	int,
	cod_exame	int,
	constraint pk_contem primary key (cod_atende,cod_exame),
	constraint fk_contem_atende foreign key (cod_atende) references atende(numero),
	constraint fk_contem_exame foreign key (cod_exame) references exame(cod_ex));


alter table paciente add column codigo INT;
	
DESCRIBE atende;

alter table paciente add constraint uk_cpf unique (cpf);


SELECT * FROM paciente;
SELECT COUNT(*) FROM medico WHERE crm = '144-mg';
SELECT * FROM exame;

INSERT INTO medico (crm,nome_m) VALUES ('123-sp','dra maria cristina');
INSERT INTO medico (crm,nome_m) VALUES ('1948-mg','dra eduardo');
INSERT INTO medico (crm,nome_m) VALUES ('947-sp','dr jose antonio');
INSERT INTO medico (crm,nome_m) VALUES ('944-mg','dra suzi antonia');
INSERT INTO medico (crm,nome_m) VALUES ('144-mg','dra claudia'), ('124-sp', 'dra maria luiza'), ('344-mg', 'dr victor');

INSERT INTO paciente (cpf, nome_p, codigo) VALUES ('12345678910','maria',1);
INSERT INTO paciente (cpf, nome_p, codigo) VALUES ('75457457345','juliano',2);
INSERT INTO paciente (cpf, nome_p, codigo) VALUES ('89649585954','clara',3);

INSERT INTO especialidade (cod_e,nome_e) VALUES (10,'dermatologia');
INSERT INTO especialidade (cod_e,nome_e) VALUES (20,'clinica');
INSERT INTO especialidade (cod_e,nome_e) VALUES (30,'oftalmologia');

SELECT * FROM medico WHERE nome_m LIKE '%ardo';

INSERT INTO convenio (cod_c, nome) VALUES (100,'amil'
);
INSERT INTO convenio (cod_c, nome) VALUES (200,'saude bradesco'
);
INSERT INTO convenio (cod_c, nome) VALUES (300,'unimed'
);

INSERT INTO exame (cod_ex,nome_ex,valor) VALUES (1,'ultrassom',25.66);
INSERT INTO exame (cod_ex,nome_ex,valor) VALUES (2,'fundo de olho',50), (3,'glicemia',30.50);

INSERT INTO atende (codigo, data_consulta, diagnostico, crm_medico, cod_paciente, cod_especialidade, cod_convenio) 
VALUES (10, '2014-04-15', 'Resfriado', '123-sp', '21243243434', 20, 100);

SHOW CREATE TABLE atende;

SELECT medico.nome_m AS nome_medico, paciente.nome_p AS nome_paciente FROM atende,medico,paciente
 WHERE atende.crm_medico = medico.crm
  AND atende.cod_paciente = paciente.cpf;

SELECT * FROM medico WHERE crm = '123-sp';
INSERT INTO paciente (cpf, nome_p, codigo) VALUES ('21243243434', 'Nome do Paciente', 1);

UPDATE paciente
SET nome_p = 'fulano'
WHERE codigo = 1;

SELECT * FROM paciente WHERE cpf = '21243243434';
SELECT * FROM especialidade WHERE cod_e = 20;
SELECT * FROM convenio WHERE cod_c = 100;


DESCRIBE paciente;

