/* 
Funções de agregação: Usadas geralmente com a cláusula GROUP BY para realizar cálculos em um conjunto de valores
COUNT() - Retorna o número de linhas.
SUM() - Soma os valores de uma coluna numérica.
AVG() - Calcula a média aritmética.
MIN() - Retorna o menor valor.
MAX() - Retorna o maior valor.
GROUP_CONCAT() - Concatena valores de múltiplas linhas em uma única string separada por vírgula.
*/

/* COUNT() */

SELECT coluna, COUNT(*)
FROM tabela
GROUP BY coluna;

/* Exemplo */

SELECT SEXO, COUNT(*) AS QTD
FROM CLIENTE
GROUP BY SEXO;

/* Irá retornar quais os sexos do banco ex: "F" e "M", junto da quantidade cadastrada de cada */

/* SUM()/AVG()/MIN()/MAX() */

SELECT SUM(coluna)
FROM tabela;

SELECT AVG(coluna)
FROM tabela;

SELECT MIN(coluna)
FROM tabela;

SELECT MAX(coluna)
FROM tabela;

/* Exemplo */

SELECT SUM(JANEIRO) AS SOMA_JAN
FROM VENDEDORES;

/* Aqui irá sair a soma dos valores de janeiro */

SELECT AVG(JANEIRO) AS MEDIA_JAN
FROM VENDEDORES;

/* Aqui irá sair a media dos valores de janeiro */

SELECT MIN(JANEIRO) AS MIN_JAN
FROM VENDEDORES;

/* Aqui irá sair o menor dos valores de janeiro */

SELECT MAX(JANEIRO) AS MAX_JAN
FROM VENDEDORES;

/* Aqui irá sair o maximo dos valores de janeiro */

/*
Funções de Data e Hora. Fundamentais para relatórios e filtros temporais.
NOW() - Retorna a data e hora atuais.
CURDATE() - Retorna apenas a data atual.
CURTIME() - Retorna apenas a hora atual.
DATE_FORMAT(data, formato) - Formata a data (ex: %d/%m/%Y).
DATEDIFF(d1, d2) - Diferença em dias entre duas datas.
DATE_ADD() / DATE_SUB() - Adiciona ou subtrai intervalos de tempo.
YEAR(), MONTH(), DAY(), HOUR() - Extraem partes específicas de uma data.
*/

SELECT colunas, NOW()
FROM tabela;

/* Exemplo */

SELECT EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA 
FROM CLIENTE;
