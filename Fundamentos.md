# Apostila-MySQL

1. Fundamentos e Estrutura

Categorias de Comandos:

•	DDL (Definition): Comandos que criam, alteram ou excluem a estrutura de objetos (bancos, tabelas, índices).

o	CREATE DATABASE / TABLE: Cria um novo banco de dados ou uma nova tabela com suas respectivas colunas e tipos.

o	ALTER TABLE: Modifica a estrutura de uma tabela já existente (adicionar, remover ou alterar colunas).

o	DROP TABLE / DATABASE: Exclui permanentemente um objeto e todas as informações contidas nele.

o	TRUNCATE: Remove todos os registros de uma tabela, mas mantém a estrutura (colunas e tipos) intacta para novos usos.

•	DML (Manipulation): Comandos voltados para a manipulação dos dados armazenados (inserir, editar, apagar).

o	INSERT INTO: Adiciona novos registros (linhas) em uma tabela existente.

o	UPDATE: Altera valores de registros que já estão no banco de dados. Atenção: Quase sempre requer a cláusula WHERE.

o	DELETE: Remove um ou mais registros de uma tabela. Atenção: Sem a cláusula WHERE, apaga todos os dados da tabela.

•	DQL (Query): É a parte mais utilizada do SQL. Focada exclusivamente em buscar e visualizar informações sem alterar o estado do banco.

o	SELECT: O comando principal para extrair dados. Define quais colunas você deseja ver.

o	FROM: Indica a tabela de origem de onde os dados serão extraídos.

o	AS (Alias): Cria um apelido temporário para uma coluna ou tabela, facilitando a leitura do resultado.

o	DISTINCT: Filtra os resultados para remover duplicatas, mostrando apenas valores únicos.

o	AND, OR, NOT: Operadores lógicos para combinar filtros.

o	BETWEEN: Filtra valores dentro de um intervalo (inclusive).

o	IN: Filtra valores que coincidem com qualquer valor em uma lista.

o	IS NULL: Busca por campos que não possuem valor gravado.

o	LIMIT: Restringe a quantidade de linhas retornadas.

•	DCL (Data Control Language): Comandos utilizados para gerenciar as permissões de acesso dos usuários ao banco de dados.

o	GRANT: Concede privilégios específicos (como SELECT, INSERT, UPDATE) a um usuário em tabelas ou bancos específicos.

o	REVOKE: Remove privilégios que foram previamente concedidos a um usuário.

o	CREATE USER: Cria uma nova conta de usuário no servidor MySQL.

o	DROP USER: Remove uma conta de usuário existente.

o	SET PASSWORD: Altera a senha de um usuário específico.

•	DTL/TCL (Transaction): Comandos que gerenciam as transações para garantir a integridade (confirmar ou reverter).

o	START TRANSACTION (ou BEGIN): Inicia uma nova transação. A partir daqui, as alterações não são permanentes até serem confirmadas.

o	COMMIT: Salva permanentemente todas as alterações feitas durante a transação atual no banco de dados.

o	ROLLBACK: Descarta todas as alterações feitas na transação atual, retornando os dados ao estado em que estavam antes do START TRANSACTION.

o	SAVEPOINT: Cria um "ponto de restauração" dentro de uma transação longa, permitindo que você desfaça apenas parte dela.

o	ROLLBACK TO SAVEPOINT: Retorna a transação ao ponto específico marcado pelo savepoint, sem cancelar a transação inteira.

o	SET AUTOCOMMIT: Define se o MySQL deve salvar cada comando individual automaticamente (1) ou se aguardará um comando manual de commit (0).

2. Relacionamentos e Agregação

Joins (Junções):

•	INNER JOIN: Retorna apenas linhas com correspondência em ambas as tabelas.

•	LEFT JOIN: Retorna tudo da tabela à esquerda e os correspondentes da direita.

•	RIGHT JOIN: Retorna tudo da tabela à direita e os correspondentes da esquerda.

•	CROSS JOIN: Cria um produto cartesiano (todas as combinações possíveis).

Funções de Agregação e Agrupamento:

•	SUM(), AVG(), COUNT(), MIN(), MAX(): Cálculos matemáticos sobre os dados.

•	GROUP BY: Agrupa linhas que têm os mesmos valores em colunas específicas.

•	HAVING: Filtro aplicado após o agrupamento (usado com funções de agregação).

Restrições (Constraints):

•	PRIMARY KEY: Identificador único da linha.

•	FOREIGN KEY: Elo de ligação com outra tabela.

•	UNIQUE: Garante que todos os valores na coluna sejam diferentes.

•	CHECK: Garante que os valores atendam a uma condição (Ex: idade > 18).

3. Nível Avançado: Performance e Lógica:

Subqueries e CTEs:

•	Subquery: Uma consulta dentro de outra (ex: no WHERE ou no FROM).

•	WITH (CTE): Define um conjunto de resultados temporário e nomeado para a query.

•	RANK() / DENSE_RANK(): Cria rankings com tratamento de empates.

•	LEAD() / LAG(): Acessa dados da linha seguinte ou anterior.

•	PARTITION BY: Define o "grupo" onde a função de janela será aplicada sem colapsar as linhas.

4. Engenharia e Programação

Objetos do Banco:

•	VIEW: Uma consulta salva que pode ser lida como se fosse uma tabela.

•	STORED PROCEDURE: Script salvo no banco que pode receber parâmetros e executar lógica.

•	TRIGGER: Gatilho que executa um comando automaticamente após um INSERT, UPDATE ou DELETE.

•	COMMIT / ROLLBACK: Confirmar ou cancelar alterações em uma transação ACID.

•	EXPLAIN: Comando usado antes do SELECT para analisar como o MySQL planeja executar a query.
