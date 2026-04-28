/* DDL - DATA DEFINITION LANGUAGE */

/* Estrutura para criar banco */

CREATE DATABASE nome_banco;

/* Exemplo */

CREATE DATABASE COMERCIO;

/* COMANDO USE para entrar no banco */

USE nome_banco;

/* Exemplo */

USE COMERCIO;

/* Estrutura deletar banco */

DROP DATABASE nome_banco;

/* Exemplo */

DROP DATABASE COMERCIO;

/* Estrutura para criar tabela */

CREATE TABLE nome_tabela(
  coluna1 TIPO,
  coluna2 TIPO,
  coluna3 TIPO
);

/* Exemplo */

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE - Irá alterar uma coluna da tabela */

/* CHANGE - Altera as definições e nome da coluna */

/* Estrutura */

ALTER TABLE nome_tabela
CHANGE coluna1 (nome antigo) coluna1 (nome novo) TIPO;

/* Exemplo */

ALTER TABLE PRODUTO 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

/* MODIFY - Altera as definições da coluna */

/* Estrutura */

ALTER TABLE nome_tabela
MODIFY coluna1 TIPO;

/* Exemplo */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* Estrutura para deletar tabelas */

DROP TABLE nome_tabela;

/* Exemplo */

DROP TABLE CLIENTE;

/* DROP COLUMN - Apagar uma coluna */

/* Estrutura */

ALTER TABLE nome_tabela
DROP COLUMN coluna1;

/* Exemplo */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADD - Adicionar uma coluna */

/* Estrutura */

ALTER TABLE nome_tabela
ADD coluna4 TIPO;

/* Exemplo */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2);

/* ADD AFTER - Inserir a coluna após outra específica da tabela */

/* Estrutura */

ALTER TABLE nome_tabela
ADD COLUMN coluna1 TIPO
AFTER coluna3;

/* Exemplo */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

/* ADD FIRST - Inserir a coluna na primeira posição da tabela */

/* Estrutura */

ALTER TABLE nome_tabela
ADD COLUMN coluna1 TIPO
FIRST;

/* Exemplo */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;
