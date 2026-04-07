# Apostila-MySQL

1. Nível Básico: Fundamentos e Estrutura

Categorias de Comandos:

DDL (Definition): Comandos que criam, alteram ou excluem a estrutura de objetos (bancos, tabelas, índices).

DML (Manipulation): Comandos voltados para a manipulação dos dados armazenados (inserir, editar, apagar).

DQL (Query): Consulta os dados.

DCL (Data Control Language): Comandos de controle de acesso e permissões de usuários.

DTL/TCL (Transaction): Comandos que gerenciam as transações para garantir a integridade (confirmar ou reverter).

Comandos de Consulta (DQL):

SELECT: Especifica quais colunas retornar.

FROM: Indica a tabela de origem.

AS: Cria um apelido (alias) para colunas ou tabelas.

AND, OR, NOT: Operadores lógicos para combinar filtros.

BETWEEN: Filtra valores dentro de um intervalo (inclusive).

IN: Filtra valores que coincidem com qualquer valor em uma lista.

IS NULL: Busca por campos que não possuem valor gravado.

LIMIT: Restringe a quantidade de linhas retornadas.

Manipulação de Dados (DML):

INSERT INTO: Adiciona novos registros.

UPDATE: Modifica registros existentes (sempre use com WHERE!).

DELETE: Remove registros (sempre use com WHERE!).

2. Nível Intermediário: Relacionamentos e Agregação

Joins (Junções):

INNER JOIN: Retorna apenas linhas com correspondência em ambas as tabelas.

LEFT JOIN: Retorna tudo da tabela à esquerda e os correspondentes da direita.

RIGHT JOIN: Retorna tudo da tabela à direita e os correspondentes da esquerda.

CROSS JOIN: Cria um produto cartesiano (todas as combinações possíveis).

Funções de Agregação e Agrupamento:

SUM(), AVG(), COUNT(), MIN(), MAX(): Cálculos matemáticos sobre os dados.

GROUP BY: Agrupa linhas que têm os mesmos valores em colunas específicas.

HAVING: Filtro aplicado após o agrupamento (usado com funções de agregação).

Restrições (Constraints):

PRIMARY KEY: Identificador único da linha.

FOREIGN KEY: Elo de ligação com outra tabela.

UNIQUE: Garante que todos os valores na coluna sejam diferentes.

CHECK: Garante que os valores atendam a uma condição (Ex: idade > 18).

3. Nível Avançado: Performance e Lógica:

Subqueries e CTEs:

Subquery: Uma consulta dentro de outra (ex: no WHERE ou no FROM).

WITH (CTE): Define um conjunto de resultados temporário e nomeado para a query.

RANK() / DENSE_RANK(): Cria rankings com tratamento de empates.

LEAD() / LAG(): Acessa dados da linha seguinte ou anterior.

PARTITION BY: Define o "grupo" onde a função de janela será aplicada sem colapsar as linhas.

4. Engenharia e Programação

Objetos do Banco:

VIEW: Uma consulta salva que pode ser lida como se fosse uma tabela.

STORED PROCEDURE: Script salvo no banco que pode receber parâmetros e executar lógica.

TRIGGER: Gatilho que executa um comando automaticamente após um INSERT, UPDATE ou DELETE.

COMMIT / ROLLBACK: Confirmar ou cancelar alterações em uma transação ACID.

EXPLAIN: Comando usado antes do SELECT para analisar como o MySQL planeja executar a query.
