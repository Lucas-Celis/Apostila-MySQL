/* Tipos de dados */

/* Estrutura */

CREATE TABLE nome_tabela(
  coluna1 TIPO,
  coluna2 TIPO(n),
  coluna3 TIPO,
  coluna4 TIPO(10,2)
);

INSERT INTO nome_tabela VALUES('variavel', 'v', 123, 10.2);

/* Exemplo */

CREATE TABLE CLIENTE(
  IDCLIENTE INT,
  NOME VARCHAR(50),
  CPF VARCHAR(14),
  NASC DATE,
  ESTADO CHAR(2),
  SEXO ENUM('F','M'),
  SALDO FLOAT(10,2)
);

/* Exemplo com todos os campos preenchidos */

INSERT INTO CLIENTE VALUES(1, 'Lucas', '123.456.789-00', '2000-01-01', 'SP', 'M', 2500.00);

/* Exemplo com campos nulos */

INSERT INTO CLIENTE VALUES(NULL, 'Lucas', '123.456.789-00', NULL, 'SP', 'M', NULL);
