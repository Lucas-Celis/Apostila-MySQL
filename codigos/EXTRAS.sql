/* VERIFICANDO TABELAS */

SHOW TABLES;

/* VERIFICANDO ESTRUTURA TABELA */

DESC nomeTabela;

/* Exemplo */

DESC CLIENTE;

/* CONECTANDO AO BANCO */

USE nomeBanco;

/* Exemplo */

USE COMERCIO;

/* COMANDO STATUS MOSTRA TODAS AS INFORMAÇÕES DO BANCO */
STATUS

/* Resultado Exemplo */
--------------
C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe  Ver 8.0.44 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          8
Current database:
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_256_GCM_SHA384
Using delimiter:        ;
Server version:         8.0.44 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 5 min 13 sec

Threads: 2  Questions: 5  Slow queries: 0  Opens: 119  Flush tables: 3  Open tables: 38  Queries per second avg: 0.015
--------------

/* ALTERANDO DELIMITADOR PARA CRIAR PROCEDURES */

DELIMITER símbolo

/* Exemplo */

DELIMITER $

/* Renomear as colunas com ALIAS (AS) */

SELECT nomeColuna AS nomeDesejado
FROM nomeTabela;

/* Exemplo */

SELECT NOME AS Cliente
FROM CLIENTE;
