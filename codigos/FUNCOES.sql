/*
Agregação - usadas com GROUP BY
COUNT() - Retorna o número de linhas.
SUM() - Soma os valores de uma coluna numérica.
AVG() - Calcula a média aritmética.
MIN() - Retorna o menor valor.
MAX() - Retorna o maior valor.
GROUP_CONCAT() - Concatena valores de múltiplas linhas em uma única string separada por vírgula.
*/

/* Estrutura */

SELECT coluna, COUNT(*)
FROM tabela
GROUP BY coluna;

SELECT SUM(coluna)
FROM tabela;

SELECT AVG(coluna)
FROM tabela;

SELECT MAX(coluna)
FROM tabela;

SELECT MIN(coluna)
FROM tabela;

SELECT coluna, GROUP_CONCAT(coluna)
FROM tabela
GROUP BY coluna;

/* Exemplo */

SELECT SEXO, COUNT(*) AS QTD
FROM CLIENTE
GROUP BY SEXO;

SELECT SUM(JANEIRO) AS SOMA_JAN
FROM VENDEDORES;

SELECT AVG(JANEIRO) AS SOMA_JAN
FROM VENDEDORES;

SELECT MAX(JANEIRO) AS SOMA_JAN
FROM VENDEDORES;

SELECT MIN(JANEIRO) AS SOMA_JAN
FROM VENDEDORES;

SELECT pedido_id, GROUP_CONCAT(produto) AS lista_de_itens
FROM itens_pedido
GROUP BY pedido_id;

/* 
Funções de data e hora
NOW() - Retorna a data e hora atuais.
CURDATE() - Retorna apenas a data atual.
CURTIME() - Retorna apenas a hora atual.
DATE_FORMAT(data, formato) - Formata a data (ex: %d/%m/%Y).
DATEDIFF(d1, d2) - Diferença em dias entre duas datas.
DATE_ADD() / DATE_SUB() - Adiciona ou subtrai intervalos de tempo.
YEAR(), MONTH(), DAY(), HOUR() - Extraem partes específicas de uma data.
*/

/* Estrutura */

SELECT NOW();

SELECT CURDATE();

SELECT CURTIME();

SELECT YEAR(NOW());
  
SELECT MONTH(NOW());
  
SELECT DAY(NOW());
  
SELECT HOUR(NOW());
  
SELECT WEEKDAY(NOW());

SELECT DATE_FORMAT(NOW(), '%d/%m/%Y');

SELECT DATE_FORMAT(NOW(), '%d de %M de %Y às %H:%i');

SELECT DATEDIFF('data destino', 'data atual');

SELECT DATE_ADD(NOW(), INTERVAL "DIAS" DAY);
-- Também funciona com horas
SELECT DATE_ADD(NOW(), INTERVAL "HORAS" HOUR);

SELECT DATE_SUB(NOW(), INTERVAL '1-2' YEAR_MONTH);

/* Exemplo */

SELECT NOW() AS data_e_hora_completa;

SELECT CURDATE() AS data_atual;

SELECT CURTIME() AS hora_atual;

SELECT YEAR(NOW()) AS ano_atual;
  
SELECT MONTH(NOW()) AS mes_atual;
  
SELECT DAY(NOW()) AS dia_atual;
  
SELECT HOUR(NOW()) AS hora_atual;
  
SELECT WEEKDAY(NOW()) AS dia_da_semana;

SELECT DATE_FORMAT(NOW(), '%d/%m/%Y') AS data_br;

SELECT DATE_FORMAT(NOW(), '%d de %M de %Y às %H:%i') AS data_extenso;

SELECT DATEDIFF('2026-12-31', '2026-05-05') AS dias_para_o_fim_do_ano;

SELECT DATE_ADD(NOW(), INTERVAL 30 DAY) AS vencimento_30_dias;
-- Também funciona com horas
SELECT DATE_ADD(NOW(), INTERVAL 3 HOUR) AS daqui_a_tres_horas;

SELECT DATE_SUB(NOW(), INTERVAL '1-2' YEAR_MONTH) AS passado_distante;

/*
Funções de String (Texto)
CONCAT(s1, s2, ...) - Junta duas ou mais strings.
UPPER() / LOWER() - Converte para maiúsculas ou minúsculas.
TRIM() - Remove espaços inúteis no início e fim.
LEFT(str, len) / RIGHT(str, len) - Pega X caracteres da esquerda ou direita.
SUBSTRING(str, start, len) - Extrai uma parte específica do texto.
REPLACE() - Substitui uma parte do texto por outra.
LENGTH() - Retorna o tamanho da string em bytes.
CHAR_LENGTH() - Retorna o número de caracteres.
*/

/* Estrutura */

SELECT CONCAT('texto1', ', ', 'texto2');
    
SELECT UPPER('texto');
  
SELECT LOWER('TEXTO');
    
SELECT TRIM('   texto   ');

SELECT LEFT('texto', quantidadeLetras);

SELECT RIGHT('texto', quantidadeLetras);
    
SELECT SUBSTRING('texto', posInicio, quantidadeLetras);
    
SELECT REPLACE('texto que irá trocar', 'palavra antiga', 'palavra nova');
    
SELECT LENGTH('texto');
      
SELECT CHAR_LENGTH('texto');

/* Exemplo */

SELECT CONCAT('Olá', ', ', 'Seja bem-vindo!') AS saudacao;
    
SELECT UPPER('mysql') AS para_maiusculo;
  
SELECT LOWER('MYSQL') AS para_minusculo;
    
SELECT TRIM('   removendo espaços   ') AS texto_limpo;

SELECT LEFT('Desenvolvimento', 5) AS primeiros_cinco;

SELECT RIGHT('Desenvolvimento', 6) AS ultimos_seis;
    
SELECT SUBSTRING('Banco de Dados', 7, 2) AS extrair_de; -- Extrai 'de' (começa na pos 7, pega 2 carac.)
    
SELECT REPLACE('Estudar Java é bom', 'Java', 'MySQL') AS troca_texto;
    
SELECT LENGTH('Café') AS tamanho_bytes; -- Retorna 5 (o 'é' ocupa 2 bytes em UTF-8)
      
SELECT CHAR_LENGTH('Café') AS total_caracteres; -- Retorna 4

/*
Funções Numéricas e Matemáticas
ROUND(valor, decimais): Arredonda para o número de casas decimais definido.
FLOOR(): Arredonda para baixo (inteiro).
CEIL(): Arredonda para cima (inteiro).
ABS(): Retorna o valor absoluto (positivo).
MOD(n, m): Retorna o resto da divisão.
RAND(): Gera um número aleatório entre 0 e 1.
*/

/* Estrutura */

SELECT ROUND(valor, casasDecimais);
    
SELECT FLOOR(valor);
    
SELECT CEIL(valor);
    
SELECT ABS(-valor);
    
SELECT MOD(valor1, divisor);
    
SELECT RAND();

/* Exemplo */

SELECT ROUND(123.4567, 2) AS arredonda_duas_casas; -- 123.46
  
SELECT ROUND(123.4567, 0) AS arredonda_inteiro;    -- 123
    
SELECT FLOOR(10.99) AS chao; -- Arredonda para baixo: 10
    
SELECT CEIL(10.01) AS teto;  -- Arredonda para cima: 11
    
SELECT ABS(-50.5) AS valor_positivo; -- Retorna 50.5
    
SELECT MOD(10, 3) AS resto_divisao; -- Retorna 1 (10 dividido por 3 sobra 1)
    
SELECT RAND() AS numero_aleatorio; -- Gera algo como 0.5482...

-- Exemplo prático: Gerar um número aleatório entre 1 e 100
SELECT FLOOR(RAND() * 100) + 1 AS aleatorio_1_a_100;

/*
Funções de Controle e Fluxo (Lógica)
IF(condição, valor_se_verdade, valor_se_falso) - Um "se" simples.
IFNULL(coluna, substituto) - Se o valor for NULL, exibe o substituto.
COALESCE(v1, v2, ...) - Retorna o primeiro valor não nulo da lista.
CASE - A estrutura lógica mais poderosa para múltiplas condições.
*/

/* Estrutura */

-- 1. IF: Um "se" simples de uma linha
SELECT coluna, IF(coluna > 0, 'Se SIM', 'Se NÃO')
FROM tabela;

-- 2. IFNULL: Tratamento rápido para valores nulos
SELECT coluna, IFNULL(coluna, "Como aparecerá o valor nulo")
FROM tabela;

-- 3. COALESCE: O "caçador" de valores válidos
SELECT coluna, COALESCE(coluna1, coluna2, coluna3, 'Como aparecerá o valor nulo')
FROM tabela;

-- 4. CASE: A estrutura completa para múltiplas condições
SELECT coluna,
    CASE 
        WHEN coluna < valor THEN 'Texto se sim'
        ELSE 'Texto se não'
    END AS coluna
FROM tabela;

/* Exemplo */

-- 1. IF: Um "se" simples de uma linha
-- Se o estoque for maior que 0, mostra 'Disponível', senão 'Esgotado'
SELECT nome, IF(estoque > 0, 'Disponível', 'Esgotado') AS status_estoque
FROM produtos;

-- 2. IFNULL: Tratamento rápido para valores nulos
-- Se o campo 'desconto' for NULL, ele assume 0.00
SELECT nome, preco, IFNULL(desconto, 0.00) AS desconto_aplicado
FROM produtos;

-- 3. COALESCE: O "caçador" de valores válidos
-- Retorna o primeiro valor que não for NULL na sequência
-- Útil quando você tem várias fontes de contato, por exemplo:
SELECT nome, COALESCE(telefone_celular, telefone_fixo, email, 'Sem contato') AS contato_principal
FROM clientes;

-- 4. CASE: A estrutura completa para múltiplas condições
-- Perfeito para criar classificações ou faixas de preço
SELECT nome,preco,
    CASE 
        WHEN preco < 50 THEN 'Econômico'
        WHEN preco BETWEEN 50 AND 150 THEN 'Intermediário'
        WHEN preco > 150 THEN 'Premium'
        ELSE 'Não Categorizado'
    END AS categoria_preco
FROM produtos;
