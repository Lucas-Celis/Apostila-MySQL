Guia Prático de MySQL: Da Modelagem à Automação

Bem-vindo a este repositório! Esta apostila foi desenvolvida para servir como um guia de referência e aprendizado sobre o ecossistema MySQL. Aqui, abordamos desde os rascunhos iniciais de um banco de dados até a criação de gatilhos complexos para automação de tarefas.
O repositório está organizado de forma didática: a teoria principal encontra-se neste documento, enquanto a pasta /codigos contém modelos sintáticos e exemplos práticos extraídos de cenários reais.
________________________________________
1. O Processo de Modelagem de Dados

Antes de escrever qualquer linha de código SQL, é fundamental entender que um banco de dados nasce de uma necessidade de negócio. Esse processo é dividido em três fases:
1.	Modelagem Conceitual: É o rascunho inicial (geralmente um desenho ou MER - Modelo Entidade-Relacionamento). Aqui, focamos no "quê" será armazenado, sem preocupação com software.
2.	Modelagem Lógica: É a transposição do rascunho para um programa de modelagem (como o MySQL Workbench). Aqui definimos nomes de campos e relações.
3.	Modelagem Física: É a criação propriamente dita do banco através de scripts SQL. É nesta fase que o DBA (Database Administrator) ou o desenvolvedor atua diretamente no servidor.
________________________________________
2. Normalização de Dados

Para evitar redundância (dados repetidos) e anomalias de atualização, utilizamos as Formas Normais. As três primeiras são essenciais:
•	1ª Forma Normal (1FN): Garante que os valores nas colunas sejam atômicos (únicos) e que não existam grupos repetidos (como vários telefones em uma única coluna).
•	2ª Forma Normal (2FN): Exige que todos os atributos não-chave dependam de toda a chave primária.
•	3ª Forma Normal (3FN): Determina que atributos não-chave não podem depender de outros atributos não-chave. Se algo não depende da chave, deve virar uma nova tabela.
________________________________________
3. Sublinguagens do SQL

O SQL é dividido em "famílias" de comandos, cada uma com um propósito:
DDL (Data Definition Language)
Comandos que definem a estrutura do banco.
•	CREATE: Cria bancos, tabelas e objetos.
•	ALTER: Altera a estrutura de tabelas existentes.
•	DROP: Remove tabelas ou bancos.
DML (Data Manipulation Language)
Comandos que lidam com os dados dentro das tabelas.
•	INSERT: Adiciona registros.
•	UPDATE: Altera registros existentes.
•	DELETE: Remove registros.
DQL (Data Query Language)
Focada na visualização dos dados.
•	SELECT: O comando principal para projetar e filtrar informações.
DCL (Data Control Language)
Trata-se da sublinguagem voltada para a segurança e administração do banco de dados. É através dela que o DBA controla quem pode acessar o quê.
•	GRANT: Concede privilégios de acesso ao usuário (ex: permitir que um usuário apenas leia dados, mas não os apague).
•	REVOKE: Remove privilégios previamente concedidos.
DTL / TCL (Data Transaction Language / Transaction Control Language)
Esta sublinguagem gerencia as transações. Uma transação é uma unidade de trabalho que deve ser executada totalmente ou não ser executada de forma alguma, garantindo a integridade dos dados (conceito ACID).
•	BEGIN / START TRANSACTION: Marca o início de uma transação.
•	COMMIT: Salva permanentemente todas as alterações feitas durante a transação no banco de dados.
•	ROLLBACK: Desfaz todas as alterações feitas na transação caso ocorra algum erro ou desistência.
•	SAVEPOINT: Cria um "ponto de restauração" dentro de uma transação longa, permitindo voltar apenas até aquele ponto sem cancelar tudo.
________________________________________
4. Tipos de Dados e Restrições (Constraints)

A escolha do tipo de dado correto impacta a performance e a integridade do sistema:
•	VARCHAR vs CHAR: O primeiro é variável, o segundo é fixo (ideal para siglas de estados, por exemplo).
•	INT e FLOAT: Para números inteiros e decimais.
•	ENUM: Permite definir uma lista restrita de valores aceitos (Ex: 'S' ou 'N').
•	Restrições: PRIMARY KEY (Identificador único), FOREIGN KEY (Elo entre tabelas), AUTO_INCREMENT e NOT NULL.
________________________________________
5. Consultas e Filtros Avançados

O poder do MySQL reside na capacidade de filtrar informações específicas:
•	Filtros Lógicos: Uso de AND, OR e NOT para combinar condições.
•	Busca de Padrões: O operador LIKE com o caractere coringa % permite buscar partes de nomes ou textos.
•	Valores Nulos: Diferença entre um campo vazio e um campo NULL (ausência de valor), utilizando IS NULL ou IS NOT NULL.
________________________________________
6. Funções de Agregação e Agrupamento

Utilizadas para gerar relatórios e estatísticas:
•	COUNT(): Conta registros.
•	SUM(): Soma valores numéricos.
•	AVG(): Calcula a média.
•	MAX() e MIN(): Identificam os valores extremos.
•	GROUP BY: Agrupa os resultados com base em uma coluna específica (ex: total de vendas por vendedor).
________________________________________
7. Relacionamentos (Joins)

Bancos de dados relacionais brilham quando conectamos tabelas. O INNER JOIN é o método mais comum, onde trazemos apenas os dados que possuem correspondência em ambas as tabelas (ex: Clientes que possuem Endereços cadastrados).
________________________________________
8. Programação em Banco de Dados

Stored Procedures
São blocos de código que ficam armazenados no servidor e podem ser chamados a qualquer momento (como funções). Facilitam a segurança e a reutilização de lógica complexa.
Triggers (Gatilhos)
São automações que "disparam" sozinhas diante de eventos de INSERT, UPDATE ou DELETE. São fundamentais para criar tabelas de log (histórico) ou backups automáticos de segurança.
________________________________________
Como usar este repositório

1.	Leia a teoria aqui no README.
2.	Navegue pela pasta /codigos para ver a sintaxe de cada comando.
3.	Execute os arquivos .sql de exemplo no seu ambiente (MySQL Workbench, Terminal ou DBeaver) para ver os resultados na prática.
________________________________________
Apostila desenvolvida para estudos de MySQL - 2026.
