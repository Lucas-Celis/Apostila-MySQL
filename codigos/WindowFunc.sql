/* 
Window Function: As Window Functions realizam cálculos em um conjunto de linhas (a "janela") que têm alguma relação com a linha atual, mas preservam a identidade de cada linha. 
*/

/* Estrutura */

SELECT 
    coluna1,
    coluna2,
    coluna3,
    -- 1. Numeração sequencial simples
    ROW_NUMBER() OVER(PARTITION BY coluna1 ORDER BY coluna2 DESC) AS nome_desejado,
    
    -- 2. Ranking com empates (pula números: 1, 2, 2, 4)
    RANK() OVER(PARTITION BY coluna1 ORDER BY coluna2 DESC) AS nome_desejado,
    
    -- 3. Ranking com empates (sem pular números: 1, 2, 2, 3)
    DENSE_RANK() OVER(PARTITION BY coluna1 ORDER BY coluna2 DESC) AS nome_desejado
FROM tabela;

/* Exemplo */

SELECT 
    vendedor_nome,
    data_venda,
    valor,
    -- 1. Numeração sequencial simples
    ROW_NUMBER() OVER(PARTITION BY vendedor_nome ORDER BY valor DESC) AS ranking_simples,
    
    -- 2. Ranking com empates (pula números: 1, 2, 2, 4)
    RANK() OVER(PARTITION BY vendedor_nome ORDER BY valor DESC) AS ranking_com_pulo,
    
    -- 3. Ranking com empates (sem pular números: 1, 2, 2, 3)
    DENSE_RANK() OVER(PARTITION BY vendedor_nome ORDER BY valor DESC) AS ranking_denso
FROM vendas;
