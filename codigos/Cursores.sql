/* 
Cursor: Os Cursores são a ferramenta que você usa quando a "força bruta" das consultas em conjunto (o padrão do SQL) não é suficiente e você precisa de um controle cirúrgico, linha por linha.
Enquanto um SELECT comum te entrega todas as linhas de uma vez, o Cursor funciona como um "dedo indicador" que aponta para uma 
linha por vez, permitindo que você execute uma lógica complexa antes de passar para a próxima.
*/

/* Estrutura 1 */

DELIMITER $

CREATE PROCEDURE nome()
BEGIN
  -- 1. Declaração de variáveis de controle
	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1, VAR2, VAR3, ... tipo_var;
	DECLARE VNOME tipo_var(n);
	
  -- 2. Declaração do CURSOR
	DECLARE nome_cursor CURSOR FOR(
		SELECT coluna1, coluna2, coluna3 FROM tabela
	);
	
  -- 3. Declaração de um HANDLER para saber quando as linhas acabarem
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
  
  -- 4. Abrindo o cursor
	OPEN nome_cursor;

  -- 5. Iniciando o Loop
	REPEAT
    -- Buscando os dados da linha atual e jogando nas variáveis
		FETCH nome_cursor INTO VNOME, VAR1, VAR2, VAR3;
		-- Se o handler sinalizou que fim não está em 1 então segue
    IF NOT FIM THEN
      --Exemplo de atribuição de valores
			SET VTOTAL = VAR1 + VAR2 + VAR3;
			SET VMEDIA = VTOTAL / 3;

			INSERT INTO tabela2 VALUES(VNOME, VAR1, VAR2, VAR3, VTOTAL, VMEDIA);
		END IF;
	UNTIL FIM END REPEAT;

  -- 6. Fechando o cursor
	CLOSE nome_cursor;
END
$

DELIMITER ;

/* Estrutura 2 */

DELIMITER $

CREATE PROCEDURE nome()
BEGIN
    -- 1. Declaração de variáveis de controle
    DECLARE var1 TIPO;
    DECLARE va2 TIPO(n,n);
    DECLARE FIM INT DEFAULT 0;

    -- 2. Declaração do CURSOR
    DECLARE cursor_nome CURSOR FOR 
        SELECT coluna, SUM(coluna) 
        FROM tabela 
        GROUP BY coluna;

    -- 3. Declaração de um HANDLER para saber quando as linhas acabarem
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim = 1;

    -- 4. Abrindo o cursor
    OPEN cursor_nome;

    -- 5. Iniciando o Loop
    read_loop: LOOP
        -- Buscando os dados da linha atual e jogando nas variáveis
        FETCH cursor_nome INTO coluna1, coluna2;

        -- Se o handler sinalizou que não há mais linhas, sai do loop
        IF fim = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Exemplo de lógica linha a linha
        IF coluna > 10000 THEN
            INSERT INTO coluna (coluna1, coluna2) 
            VALUES (coluna1, coluna2 * 0.10);
        ELSE
            INSERT INTO oluna (coluna1, coluna2) 
            VALUES (coluna1, coluna2 * 0.05);
        END IF;

    END LOOP;

    -- 6. Fechando o cursor
    CLOSE cursor_nome;

END$

DELIMITER ;

/* Exemplo 1 */

DELIMITER $

CREATE PROCEDURE INSEREDADOS()
BEGIN
	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(50);
	
	DECLARE REG CURSOR FOR(
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
	);
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;

	OPEN REG;

	REPEAT
		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
		IF NOT FIM THEN
			SET VTOTAL = VAR1 + VAR2 + VAR3;
			SET VMEDIA = VTOTAL / 3;

			INSERT INTO VEND_TOTAL VALUES(VNOME, VAR1, VAR2, VAR3, VTOTAL, VMEDIA);
		END IF;
	UNTIL FIM END REPEAT;

	CLOSE REG;
END
$

DELIMITER ;

/* Chamando o cursor */

CALL INSEREDADOS();

/* Exemplo 2 */

DELIMITER $

CREATE PROCEDURE sp_processar_bonus_vendedores()
BEGIN

    DECLARE v_vendedor_id INT;
    DECLARE v_total_vendas DECIMAL(10,2);
    DECLARE fim_do_cursor INT DEFAULT 0;

    DECLARE cursor_vendas CURSOR FOR 
        SELECT id_vendedor, SUM(valor) 
        FROM vendas 
        GROUP BY id_vendedor;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_cursor = 1;

    OPEN cursor_vendas;

    read_loop: LOOP
      
        FETCH cursor_vendas INTO v_vendedor_id, v_total_vendas;

        IF fim_do_cursor = 1 THEN
            LEAVE read_loop;
        END IF;

        IF v_total_vendas > 10000 THEN
            INSERT INTO bonus_pagamento (vendedor_id, valor_bonus) 
            VALUES (v_vendedor_id, v_total_vendas * 0.10);
        ELSE
            INSERT INTO bonus_pagamento (vendedor_id, valor_bonus) 
            VALUES (v_vendedor_id, v_total_vendas * 0.05);
        END IF;

    END LOOP;

    CLOSE cursor_vendas;

END$

DELIMITER ;

/* Chamando o cursor */

CALL sp_processar_bonus_vendedores();
