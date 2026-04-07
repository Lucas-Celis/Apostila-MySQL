/* DDL - DATA DEFINITION LANGUAGE */

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE - Irá alterar uma coluna da tabela */

/* CHANGE - Altera as definições e nome da coluna */

ALTER TABLE PRODUTO 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

/* MODIFY - Altera as definições da coluna */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADD - Adicionar uma coluna */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2);

/* DROP COLUMN - Apagar uma coluna */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* AFTER - Inserir a coluna após outra específica da tabela */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

/* FIRST - Inserir a coluna na primeira posição da tabela */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

/* DML - DATA MANIPULATION LANGUAGE */

/* INSERT - Irá inserir dados na tabela */

/* TIPOS DE INSERTs */

/* FORMA 01 - OMITINDO COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 03 INSERT COMPACTO - SOMENTE NO MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

/* EXEMPLO PRÁTICO DE INSERT */

INSERT INTO CLIENTE VALUES(NULL, 'PAULA', 'M', NULL, '77437493');

/* UPDATE - Irá atualizar determinado dado da tabela */

UPDATE CLIENTE
	SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE - Irá deletar determinado dado da tabela */

INSERT INTO CLIENTE VALUES(NULL, 'XXX', 'M', NULL, 'XXXX');

DELETE FROM CLIENTE
WHERE IDCLIENTE = 8;

/* DQL - Data Query Language */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         8 | XXX    | M    | NULL           | XXXX        |
+-----------+--------+------+----------------+-------------+

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
|         7 | PAULA  | M    | NULL           | 77437493    |
+-----------+--------+------+----------------+-------------+

/* DCL - Data Control Language */

-- Criar um novo usuário
CREATE USER 'analista_dados'@'localhost' IDENTIFIED BY 'SenhaForte123';

-- Conceder permissões de leitura e inserção em um banco específico
GRANT SELECT, INSERT ON meu_banco.* TO 'analista_dados'@'localhost';

-- Conceder todas as permissões (Cuidado: uso administrativo)
GRANT ALL PRIVILEGES ON meu_banco.* TO 'admin_projeto'@'%';

-- Revogar (remover) a permissão de inserção
REVOKE INSERT ON meu_banco.* FROM 'analista_dados'@'localhost';

-- Excluir um usuário
DROP USER 'analista_dados'@'localhost';

-- Atualizar permissões no servidor
FLUSH PRIVILEGES;

/* DTL / TCL - Data Transaction Control */

-- Iniciar a jornada da transação
START TRANSACTION;

-- Passo 1: Retirar dinheiro da conta A
UPDATE contas SET saldo = saldo - 100.00 WHERE id = 1;

-- Criar um ponto de salvamento (opcional)
SAVEPOINT pos_saque;

-- Passo 2: Tentar depositar na conta B
UPDATE contas SET saldo = saldo + 100.00 WHERE id = 2;

-- SE TUDO DEU CERTO: Confirmar e salvar permanentemente
COMMIT;

-- SE ALGO FALHOU (ex: a conta B não existe): Desfazer tudo
-- ROLLBACK; 

-- SE QUISER DESFAZER APENAS O DEPÓSITO MAS MANTER O SAQUE:
-- ROLLBACK TO SAVEPOINT pos_saque;

/* AutoCommit */

-- Desativar o salvamento automático (cada INSERT/UPDATE precisará de um COMMIT manual)
SET AUTOCOMMIT = 0;

-- Reativar o salvamento automático (Padrão do MySQL)
SET AUTOCOMMIT = 1;
