/* Constraints */

/*
  PRIMARY KEY - Chave identificadora da tabela
  NOT NULL - Campo não pode conter valores nulos
  AUTO_INCREMENT - Campo tem seu valor incrementado automaticamente
  FOREIGN KEY - Chave estrangeira originária de chave identificadora de outra tabela
  UNIQUE - Valores distintos na tabela (casos que não podem se repetir, ex. CPF, RG, EMAIL)
*/

/* Estrutura com FOREIGN KEY dentro da criação da tabela *NÃO RECOMENDADO* */

CREATE TABLE nome_tabela(
  coluna1 TIPO PRIMARY KEY AUTO_INCREMENT,
  coluna2 TIPO(n) NOT NULL,
  coluna3 TIPO UNIQUE,
  coluna4 TIPO(10,2)
  coluna5 TIPO,

  FOREIGN KEY (coluna5)
  REFERENCES nome_tabela(coluna_chave)
);

/* Estrutura com FOREIGN KEY FOREIGN KEY fora da criação da tabela com ALTER TABLE *RECOMENDADO* */

CREATE TABLE nome_tabela(
  coluna1 TIPO PRIMARY KEY AUTO_INCREMENT,
  coluna2 TIPO(n) NOT NULL,
  coluna3 TIPO UNIQUE,
  coluna4 TIPO(10,2)
  coluna5 TIPO
);

ALTER TABLE nome_tabela
ADD CONSTRAINT FK_tabelaDestino_tabelaOrigem
FOREIGN KEY (chaveEstrangeira)
REFERENCES tabelaOrigem(chavePrimaria);

/* Estrutura inserção de dados */

INSERT INTO nome_tabela VALUES(NULL, 'v', 123, 10.2, 1);

/* Exemplo com FOREIGN KEY dentro da criação da tabela *NÃO RECOMENDADO* */

CREATE TABLE CLIENTE(
  IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(50) NOT NULL,
  CPF VARCHAR(14) UNIQUE NOT NULL,
  NASC DATE,
  ESTADO CHAR(2) NOT NULL,
  SEXO ENUM('F','M') NOT NULL,
  SALDO FLOAT(10,2),
  ID_VENDA INT,

  FOREIGN KEY (ID_VENDA)
  REFERENCES VENDA(IDVENDA)
);

/* Exemplo com FOREIGN KEY fora da criação da tabela com ALTER TABLE *RECOMENDADO* */

CREATE TABLE CLIENTE(
  IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(50) NOT NULL,
  CPF VARCHAR(14) UNIQUE NOT NULL,
  NASC DATE,
  ESTADO CHAR(2) NOT NULL,
  SEXO ENUM('F','M') NOT NULL,
  SALDO FLOAT(10,2),
  ID_VENDA INT
);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_VENDA
FOREIGN KEY (ID_VENDA)
REFERENCES VENDA(IDVENDA);

/* Exemplo inserção de dados */

INSERT INTO CLIENTE VALUES(NULL, 'Lucas', '123.456.789-00', '2000-01-01', 'SP', 'M', 2500.00, 1);
