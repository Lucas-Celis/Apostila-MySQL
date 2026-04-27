/* DTL / TCL - Data Transaction Control */

-- Iniciar a jornada da transação
START TRANSACTION;

-- Passo 1: Retirar dinheiro da conta A
UPDATE contas SET saldo = saldo - 100.00 WHERE id = 1;

-- Criar um ponto de salvamento (opcional)
SAVEPOINT pos_saque;

-- Passo 2: Tentar depositar na conta B
UPDATE contas SET saldo = saldo + 100.00 WHERE id = 2;

-- SE TUDO DEU CERTO: Confirmar e salvar permanentemente
COMMIT;

-- SE ALGO FALHOU (ex: a conta B não existe): Desfazer tudo
-- ROLLBACK; 

-- SE QUISER DESFAZER APENAS O DEPÓSITO MAS MANTER O SAQUE:
-- ROLLBACK TO SAVEPOINT pos_saque;

/* AutoCommit */

-- Desativar o salvamento automático (cada INSERT/UPDATE precisará de um COMMIT manual)
SET AUTOCOMMIT = 0;

-- Reativar o salvamento automático (Padrão do MySQL)
SET AUTOCOMMIT = 1;
