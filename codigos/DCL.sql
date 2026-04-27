/* DCL - Data Control Language */

-- Criar um novo usuário
CREATE USER 'analista_dados'@'localhost' IDENTIFIED BY 'SenhaForte123';

-- Conceder permissões de leitura e inserção em um banco específico
GRANT SELECT, INSERT ON meu_banco.* TO 'analista_dados'@'localhost';

-- Conceder todas as permissões (Cuidado: uso administrativo)
GRANT ALL PRIVILEGES ON meu_banco.* TO 'admin_projeto'@'%';

-- Revogar (remover) a permissão de inserção
REVOKE INSERT ON meu_banco.* FROM 'analista_dados'@'localhost';

-- Excluir um usuário
DROP USER 'analista_dados'@'localhost';

-- Atualizar permissões no servidor
FLUSH PRIVILEGES;
