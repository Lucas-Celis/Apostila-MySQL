/* CTE - permitem que você crie um conjunto de resultados temporários que pode ser referenciado dentro de uma query principal. Pense nelas como variáveis para tabelas. */

/* Estrutura */

WITH nome AS(
	SELECT nome_coluna_tab1, nome_coluna_tab2
	FROM nome_tabela1
	INNER JOIN nome_tabela2
	ON tab1.cond_tab1 = tab2.cond_tab2
	GROUP BY coluna;
)
  
SELECT * 
FROM nome
ORDER BY coluna DESC/ASC;

/*Exemplo*/

WITH resumoVendas AS(
	SELECT v.nome, sum(s.total) AS total
	FROM relacional.vendedores v
	INNER JOIN relacional.vendas s
	ON v.idvendedor = s.idvendedor
	GROUP BY v.idvendedor, s.idvendedor
)

SELECT * 
FROM resumoVendas
ORDER BY total DESC;
