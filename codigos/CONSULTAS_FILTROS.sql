/* A consulta é feita através da projeção, origem, seleção e se necessário a junção das tabelas (Se tiver dúvidas deste conceito abrir o código CONCEITOS_POJS.sql) */

SELECT nomeColunas
FROM nomeTabela
INNER JOIN tabela2
ON chaveTabela1 = chaveTabela2
WHERE coluna = dado;

/* Exemplo */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /* JUNÇÃO */
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELEÇÃO */

/* Porém a magia está na filtragem para esta consulta e não apenas trazer dados "soltos" */

/*
Operadores de comparação temos os principais:
> - Maior
< - Menor
>= - Maior igual
<= - Menor igual
= - Igual
<> - Diferente
*/

/*
Usando WHERE temos estes operadores lógicos:
AND - E
OR - OU
NOT - NÃO
*/

SELECT nomeColunas
FROM nomeTabela
INNER JOIN tabela2
ON chaveTabela1 = chaveTabela2
WHERE coluna = dado1 AND coluna = dado2;

/* Exemplo */

SELECT NOME, VALORCOMPRA AS "VALOR GASTO"
FROM CLIENTE
	INNER JOIN COMPRAS 
	ON IDCLIENTE = ID_CLIENTE
WHERE VALORCOMPRA >= 300 AND VALORCOMPRAS <= 900;

/*
Usando LIKE e "%" temos:
%Ana - Irá buscar tudo que acabe com "ANA" ex: "banANA"
Ana% - Irá buscar tudo que comece com "ANA" ex: "ANA Julia"
%Ana% - Irá buscar tudo que possuí "ANA" no meio ex: "bANAna"
*/

SELECT nomeColunas
FROM nomeTabela
INNER JOIN tabela2
ON chaveTabela1 = chaveTabela2
WHERE coluna LIKE %dado;

/* Exemplo */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
	INNER JOIN ENDERECO
	ON IDCLIENTE = ID_CLIENTE
WHERE NOME LIKE 'Ric%';

/* Possuímos também o operador IN, BETWEEN e EXISTS */

SELECT nomeColunas
FROM nomeTabela
INNER JOIN tabela2
ON chaveTabela1 = chaveTabela2
WHERE coluna IN ('dado1','dado2');

SELECT nomeColunas
FROM nomeTabela
INNER JOIN tabela2
ON chaveTabela1 = chaveTabela2
WHERE coluna BETWEEN 'dado1' AND 'dado2';

/* Exemplo */

SELECT IDCLIENTE, NUMERO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F' AND TIPO IN ('RES','COM');

SELECT IDCLIENTE, NUMERO, DATAVEND
FROM CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE
WHERE DATAVEND BETWEEN '2026-03-01' AND '2026-03-30';
