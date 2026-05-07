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

4.1. Tipos Numéricos. Utilizados para cálculos e armazenamento de quantidades.

•	INT / INTEGER: Números inteiros.

•	FLOAT / DOUBLE: Números decimais de precisão variável.

•	DECIMAL(p, s): Ideal para valores monetários (Ex: DECIMAL(10,2) armazena até 10 dígitos, com 2 após a vírgula).

4.2. Tipos de Texto (Strings). Para nomes, descrições e códigos alfanuméricos.

•	CHAR(n): Comprimento fixo (mais rápido para códigos curtos como UF: 'SP', 'RJ').

•	VARCHAR(n): Comprimento variável (economiza espaço para nomes e e-mails).

•	TEXT: Para grandes blocos de texto (descrições, artigos).

•	ENUM: Uma lista de valores permitidos (Ex: 'M', 'F').

4.3. Tipos de Data e Hora. Cruciais para auditoria e cronogramas.

•	DATE: Apenas data (AAAA-MM-DD).

•	DATETIME: Data e hora combinadas.

•	TIMESTAMP: Armazena a data/hora com base no fuso horário (útil para registros de criação/alteração).

4.5. Outros Tipos

•	JSON: Armazena documentos JSON nativamente, permitindo buscas dentro do objeto.

•	BLOB: Para dados binários

•	Restrições: PRIMARY KEY (Identificador único), FOREIGN KEY (Elo entre tabelas), AUTO_INCREMENT (Valor incrementado automaticamente), NOT NULL (Valores não nulos) e UNIQUE (Valores distintos).
________________________________________
5. Consultas e Filtros Avançados

O verdadeiro poder do MySQL não está em apenas "trazer dados", mas em refinar a busca para obter informações precisas em meio a milhões de registros.

5.1. Operadores de Comparação. Estes operadores comparam o valor de uma coluna com outro valor ou com outra coluna. O resultado dessa comparação é sempre um booleano: verdadeiro ou falso.

•	Igual a (=): Verifica se dois valores são exatamente iguais.

o	Exemplo: WHERE preco = 50.00 (Retorna apenas o que custa exatamente 50).

•	Diferente de (<> ou !=): Ambas as formas funcionam no MySQL, mas <> é o padrão oficial do SQL. Retorna tudo, exceto o valor especificado.

o	Exemplo: WHERE status <> 'cancelado'

•	Maior que (>) e Menor que (<): Usados para valores numéricos e datas.

o	Exemplo: WHERE estoque < 10 (Filtra produtos acabando).

o	Exemplo: WHERE data_criacao > '2024-01-01' (Registros deste ano).

•	Maior ou Igual a (>=) e Menor ou Igual a (<=): Semelhantes aos anteriores, mas incluem o valor de referência na busca.

o	Exemplo: WHERE idade >= 18 (Inclui quem tem exatamente 18 anos).

•	Igual a Seguro para NULL (<=>): Este é um "truque" avançado do MySQL. Diferente do =, este operador consegue comparar valores NULL sem retornar um erro ou resultado vazio. Ele retorna 1 (verdadeiro) se ambos os valores forem NULL e 0 (falso) se apenas um for.

o	Exemplo: WHERE valor_desconto <=> NULL

5.2. Filtros Lógicos e Precedência. Os operadores lógicos permitem combinar múltiplas condições no WHERE. No entanto, a ordem em que o MySQL os processa é crucial.

•	AND: Retorna verdadeiro apenas se todas as condições forem atendidas.

•	OR: Retorna verdadeiro se pelo menos uma das condições for atendida.

•	NOT: Inverte o resultado da expressão lógica.

Atenção à Precedência: O AND tem prioridade sobre o OR. Para evitar resultados inesperados, use parênteses para forçar a ordem desejada.

Exemplo: WHERE (status = 'Ativo' OR status = 'Pendente') AND valor > 100 é muito diferente de WHERE status = 'Ativo' OR status = 'Pendente' AND valor > 100.

5.3. Busca de Padrões (Wildcards). O operador LIKE é utilizado para buscas textuais parciais, utilizando caracteres "coringa":

•	% (Percentual): Representa zero, um ou múltiplos caracteres.

o	LIKE 'Ana%': Começa com Ana (Ana, Anabela, Analice).

o	LIKE '%Sena': Termina com Sena (Sena, Lucena, Cassena).

o	LIKE '%casa%': Contém "casa" em qualquer posição.

•	_ (Underline): Representa exatamente um único caractere.

o	LIKE '_ana': Encontra "Bana" ou "Cana", mas não "Anatiel".

•	REGEXP (Opcional Avançado): Para buscas complexas que o LIKE não resolve, como encontrar apenas textos que começam com números ou possuem um formato específico de e-mail.

5.4. O Enigma do NULL (Lógica Tri-valente). Um dos erros mais comuns em SQL é tratar NULL como se fosse um valor zero ou uma string vazia. No MySQL, NULL significa valor desconhecido.

•	IS NULL: Verifica se o campo não possui valor atribuído.

•	IS NOT NULL: Filtra apenas registros que possuem algum dado preenchido.

•	Diferença Crucial:

o	campo = '': É uma string vazia (um valor conhecido de comprimento zero).

o	campo = 0: É um valor numérico real.

o	campo IS NULL: É a ausência total de informação.

Dica de Ouro: Nunca use = NULL ou != NULL. O SQL utiliza uma lógica de três valores (Verdadeiro, Falso e Desconhecido). Qualquer comparação direta com NULL resultará em "Desconhecido", e a linha não será exibida.

5.5. Outros Operadores de Refinamento. Para deixar sua consulta mais elegante e performática, utilize estes filtros que simplificam a lógica do seu código:

•	Operador IN: Substitui múltiplos usos do operador OR, verificando se o valor de uma coluna está contido em uma lista específica ou no resultado de uma subconsulta.

o	Exemplo: WHERE uf IN ('SP', 'RJ', 'MG')

•	Operador BETWEEN: Define um intervalo inclusivo (onde os valores das extremidades também contam). É extremamente útil para filtrar intervalos numéricos ou períodos de datas.

o	Exemplo: WHERE data BETWEEN '2024-01-01' AND '2024-01-31'

•	Operador EXISTS: Funciona como um teste booleano que verifica se uma subconsulta retorna qualquer linha. É geralmente mais rápido que o IN quando lidamos com grandes volumes de dados em tabelas relacionadas.

o	Exemplo: WHERE EXISTS (SELECT 1 FROM log WHERE id_user = u.id)
________________________________________
6. Funções de Agregação e Agrupamento

6.1. Funções de Agregação. Usadas geralmente com a cláusula GROUP BY para realizar cálculos em um conjunto de valores.

•	COUNT(): Retorna o número de linhas.

•	SUM(): Soma os valores de uma coluna numérica.

•	AVG(): Calcula a média aritmética.

•	MIN(): Retorna o menor valor.

•	MAX(): Retorna o maior valor.

•	GROUP_CONCAT(): Concatena valores de múltiplas linhas em uma única string separada por vírgula.

6.2. Funções de Data e Hora. Fundamentais para relatórios e filtros temporais.

•	NOW(): Retorna a data e hora atuais.

•	CURDATE(): Retorna apenas a data atual.

•	CURTIME(): Retorna apenas a hora atual.

•	DATE_FORMAT(data, formato): Formata a data (ex: %d/%m/%Y).

•	DATEDIFF(d1, d2): Diferença em dias entre duas datas.

•	DATE_ADD() / DATE_SUB(): Adiciona ou subtrai intervalos de tempo.

•	YEAR(), MONTH(), DAY(), HOUR(): Extraem partes específicas de uma data.

6.3. Funções de String (Texto). Para formatar e manipular textos.

•	CONCAT(s1, s2, ...): Junta duas ou mais strings.

•	UPPER() / LOWER(): Converte para maiúsculas ou minúsculas.

•	TRIM(): Remove espaços inúteis no início e fim.

•	LEFT(str, len) / RIGHT(str, len): Pega X caracteres da esquerda ou direita.

•	SUBSTRING(str, start, len): Extrai uma parte específica do texto.

•	REPLACE(): Substitui uma parte do texto por outra.

•	LENGTH(): Retorna o tamanho da string em bytes.

•	CHAR_LENGTH(): Retorna o número de caracteres.

6.4. Funções Numéricas e Matemáticas. Para cálculos matemáticos de precisão ou arredondamento.

•	ROUND(valor, decimais): Arredonda para o número de casas decimais definido.

•	FLOOR(): Arredonda para baixo (inteiro).

•	CEIL(): Arredonda para cima (inteiro).

•	ABS(): Retorna o valor absoluto (positivo).

•	MOD(n, m): Retorna o resto da divisão.

•	RAND(): Gera um número aleatório entre 0 e 1.

6.5. Funções de Controle e Fluxo (Lógica). Permitem criar lógica condicional diretamente no seu SELECT.

•	IF(condição, valor_se_verdade, valor_se_falso): Um "se" simples.

•	IFNULL(coluna, substituto): Se o valor for NULL, exibe o substituto.

•	COALESCE(v1, v2, ...): Retorna o primeiro valor não nulo da lista.

•	CASE: A estrutura lógica mais poderosa para múltiplas condições.

-> CASE WHEN condicao THEN resultado ELSE outro END
________________________________________
7. Relacionamentos (Joins)

•	INNER JOIN: Retorna apenas registros que possuem correspondência em ambas as tabelas.

•	LEFT JOIN: Retorna todos os registros da tabela da esquerda, e os correspondentes da direita. Se não houver par, retorna NULL.

•	RIGHT JOIN: O oposto do Left Join.

•	CROSS JOIN: Cria um produto cartesiano (combina cada linha de A com todas de B).
________________________________________
8. Programação em Banco de Dados

•	Stored Procedures
São blocos de código que ficam armazenados no servidor e podem ser chamados a qualquer momento (como funções). Facilitam a segurança e a reutilização de lógica complexa.

•	Triggers (Gatilhos)
São automações que "disparam" sozinhas diante de eventos de INSERT, UPDATE ou DELETE. São fundamentais para criar tabelas de log (histórico) ou backups automáticos de segurança.
________________________________________
9. Subqueries e CTEs (Common Table Expressions)

Às vezes, você precisa de um resultado temporário para usar na consulta principal.

•	Subqueries (Subconsultas)
Podem ser usadas no WHERE ou no FROM.

Ex:

SELECT nome 

FROM produtos 

WHERE preco > (SELECT AVG(preco) FROM produtos);

•	CTEs (Cláusula WITH)
É a forma moderna e legível de fazer subconsultas. Elas funcionam como "tabelas temporárias" que existem apenas durante a execução daquela query.

Ex:

SQL

WITH ResumoVendas AS (
    SELECT cliente_id, SUM(total) as soma 
    FROM pedidos 
    GROUP BY cliente_id
)

SELECT * FROM ResumoVendas WHERE soma > 1000;
________________________________________
10. Window Functions (Funções de Janela)

Introduzidas no MySQL 8.0, elas permitem cálculos em um conjunto de linhas relacionadas sem precisar de um GROUP BY que "esconda" os detalhes da linha.

•	ROW_NUMBER(): Cria um ranking/numeração sequencial.

•	RANK() / DENSE_RANK(): Cria rankings lidando com empates.

•	OVER (PARTITION BY ...): Define o "grupo" onde o cálculo será feito.
________________________________________
11. Views: Tabelas Virtuais

Uma View é essencialmente uma consulta SQL armazenada no banco de dados. Quando você consulta uma View, o MySQL executa a query subjacente em tempo real e retorna os resultados.

Por que usar Views?

•	Segurança: Você pode dar acesso a uma View que contém apenas colunas "públicas", escondendo dados sensíveis (como salários ou senhas) da tabela original.

•	Simplicidade: Transforma JOINs gigantescos e complexos em um simples SELECT * FROM nome_da_view.

•	Consistência: Garante que todos na equipe usem a mesma lógica de cálculo (ex: a definição de "lucro" é a mesma para todos os relatórios).
________________________________________
12. Cursores: O Processamento Linha a Linha

No SQL, trabalhamos normalmente com conjuntos (Sets). No entanto, em Stored Procedures, às vezes precisamos percorrer os resultados de uma consulta para aplicar regras de negócio que não podem ser resolvidas com um simples UPDATE. É aí que entram os cursores.

•	O Ciclo de Vida de um Cursor:
Para usar um cursor, você deve seguir obrigatoriamente estes quatro passos:

1.	DECLARE: Define a query que o cursor vai percorrer.

2.	OPEN: Executa a query e prepara a memória.

3.	FETCH: "Puxa" a próxima linha para dentro de variáveis.

4.	CLOSE: Libera os recursos da memória.

⚠️ Aviso de Performance: Cursores são mais lentos que operações baseadas em conjuntos. Use-os apenas quando a lógica linha a linha for estritamente necessária!
________________________________________
Como usar este repositório

1.	Leia a teoria aqui no README.
2.	Navegue pela pasta /codigos para ver a sintaxe de cada comando.
3.	Execute os arquivos .sql de exemplo no seu ambiente (MySQL Workbench, Terminal ou DBeaver) para ver os resultados na prática.
________________________________________
Apostila desenvolvida para estudos de MySQL - Lucas Eduardo de Celis - 2026.
