/* 
Views: As Views são como o "atalho na área de trabalho" do seu banco de dados. 
Elas permitem que você salve uma query complexa e a trate como se fosse uma tabela real, 
mas com um detalhe crucial: ela não armazena dados próprios. 
*/

/* Estrutura criar a view */

CREATE VIEW nome_view AS
SELECT coluna1, coluna2, coluna3
FROM tabela1
INNER JOIN tabela2
ON chave1 = chave2
INNER JOIN tabela3
ON chave1 = chave3;

/* Excluir a view */

DROP VIEW nome_view;

/* Chamando a view */

SELECT * FROM nome_view;

/* Exemplo */

CREATE VIEW V_RELATORIO AS
SELECT C.NOME,
			 C.SEXO,
			 IFNULL(C.EMAIL,'NÃO POSSUI E-MAIL') AS "E-MAIL",
			 T.TIPO,
			 T.NUMERO,
			 E.BAIRRO,
			 E.CIDADE,
			 E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

/* Excluindo a view */

DROP VIEW V_RELATORIO;

/* Chamando a View */

SELECT * FROM V_RELATORIO;
