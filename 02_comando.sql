--Verificar os usuário
SELECT user FROM mysql.user;

-- Acessando o mysql pelo terminal do Linux
mysql -h localhost -u root -p
-- Dump do banco de dados
server
data export
	
-- Autorizar Drop do Data Base
edit
preferences
SQL Editor
SAFE Updates(rejects Updates AND Deletes WITH NO restrictions)

--DIAGRAMA
DATABASE
reverse engineer

--DESABILITAR ATUALIZAÇÃO
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1; 

EXPLAINr um banco de dados
CREATE DATABASE nome_do_banco 
DROPULT character SET utf8 -- padrão de acentuaão 
DEFAULT COLLATE utf8_general_ci;

--CONSULTA BANCO
USE nome_do_banco
SHOW DATABASEs; 

EXPLAINar tabela para banco de dados
CREATE TABLE IF NOT EXISTS nome_da_tabela( -- if not EXISTS - caso tiver uma tabela cursos o BD não deixará sobrescrevDROPid INT not null auto_increment, -- não precisa dar a informação. O BD irá colocar automáticamente
	nome VARCHAR (30) NOT NULL UNIQUE, -- not null obriga escrever no campo - Constranger unique/ terá um nome apenas no registro
	nascimento date,
	sexo enum ('F', 'M'),
	carga INT unsigned,  -- unsigned - não poderá ter sinais no registro
	peso DECIMAL (5, 2),
	altura DECIMAL (3,2),
	nacionalidade VARCHAR (30) DEFAULT 'Brasil', -- DEFAULT - caso não colocar a informação o BD irá colocar o padrão
	PRIMARY KEY (id) -- coloca a chave primária para a tabela
) DEFAULT charset = utf8; -- charset - para não termos problema de acentuaçãoptimize

SHOW DATABASEs;
SHOW tables;
USE nome_do_banco;
describe nome_da_tabela;

-- excluir um banco/schema
DROP DATABASE nome_do_banco;

-- inserir dados do usuário
INSERT INTO nome_da_tabela
	(id, nome, nascimento, sexo, peso, altura, nascionalidade) -- todos os campos da tabela
VALUES
	(DEFAULT, 'Robson', '1984-08-20', 'M', '84.0', '1.79', 'Brasil');

-- inserir usuários quando todas AS informções forem padrão
INSERT INTO nome_da_tabela VALUES
	(DEFAULT, 'Ana', '1982-10-24', 'F', '56.0', '1.62', 'Brasil');

-- inserir varios usuários no banco
INSERT INTO nome_da_tabela VALUES
	(DEFAULT, 'Sofia Souza', '2016-03-21', 'F', '25.0', '1.20', 'Brasil'),
    (DEFAULT, 'Iris Souza', '1961-08-17', 'F', '60.0', '1.57', 'Brasil');

-- add a chave primária
ALTER TABLE nome da tabela ADD PRIMARY KEY(nome da colula que será chave primária);

-- add chave estrangeira
	-- preciso acrescentar à tabela a coluna que iremos trazer
ALTER table carro ADD column fk_id_pessoa INT;
ALTER table carro ADD FOREIGN KEY (fk_id_pessoa) REFERENCES carro(id_carro);

-- acrescentando coluna na tabela 
ALTER TABLE nome_da_tabela ADD column nome_da_coluna VARCHAR (10);

-- acrescentando coluna na tabela escolhendo a posição 
ALTER TABLE nome_da_tabela ADD column nome_da_coluna VARCHAR (10) AFTER nome_da_coluna;

-- acrescentando coluna na tabela escolendo a primeira posião da tabela
ALTER TABLE nome_da_tabela ADD column nome_da_coluna INT FIRST;

-- excluir coluna da tabela
ALTER TABLE nome_da_tabela DROP column nome_da_coluna;

-- modificando AS informações da coluna/campo da tabela
ALTER TABLE nome_da_tabela MODIFY column nome_da_coluna VARCHAR(20) DEFAULT '';

-- modificando no nome da coluna
ALTER TABLE nome_da_tabela change column nome_da_coluna nome_para_modificar VARCHAR(15) DEFAULT 'Brasil' not null;

-- modificar o nome da tabela
ALTER TABLE nome_da_tabela rename TO nome_para_modificar;

-- apagar a tabela
DROP TABLE IF EXISTS nome da tabela;

-- mudar os registros - Update --> Comando para moficar a linha da tabela
UPDATE nome da tabela SET nome_da_coluna = 'robson' WHERE nome_da_coluna = 1;

--UPDATE
UPDATE nome_da_tabela SET nome_da_coluna = 'Mysql' nome_da_coluna = 'YouTube' WHERE nome_da_coluna = 1
UPDATE nome_da_tabela SET nome_da_coluna = 'robson' WHERE nome_da_coluna = 1
UPDATE tabela_de_produtos SET preco_de_lista = preco_de_lista = 0 WHERE sabor = 'melância';

 -- remover linhas da tabela
DELETE FROM nome_da_tabela WHERE idcurso = '8'

-- deletar mais de um linha
DELETE FROM cursos WHERE i curso = 2022 -- Se na tabela tiver mais de um usuário tiver no campo o ano 2022	

-- deletar todas linhas de tabela
truncate TABLE cursos	

-- COMANDOS USANDO SELECT

-- Selecionar do tabela
SELECT * FROM nome_da_tabela;

-- Orderna a TABLE pela colula - ORDER BY				
SELECT * FROM tabela_de_produtos ORDER BY preco_de_lista; 

-- Orderna a TABLE pela coluna de baixo para cima
SELECT * FROM tabela_de_produtos ORDER BY preco_de_lista desc; 

-- ordernar primeiro pela coluna sabor e depois preço
SELECT * FROM tabela_de_produtos ORDER BY sabor, preco_de_lista; 

--ordernar a primeira coluna ascendente e a segunda descendente
SELECT * FROM tabela_de_produtos ORDER BY sabor ASC, preco_de_lista DESC; 

-- selecionar coluna
SELECT idcurso, nome, ano FROM cursos -- posso colocar os campos invertidos

-- pesquisar o banco por linhas
SELECT * FROM nome_da_tabela WHERE nome_da_coluna = '1'
SELECT nome_da_coluna, nome_da_coluna FROM nome_da_tabelas WHERE nome_da_coluna = '1'
SELECT nome_da_coluna, nome_da_coluna,nome_da_coluna FROM nome_da_tabela WHERE nome_da_coluna > '1'

-- operadores relacionais - =, <,>,<=,>=,!=,<> 
SELECT nome_da_coluna FROM nome_da_tabela WHERE nome BETWEEN 7 AND 10;
SELECT nome_da_coluna, nome_da_coluna, nome_da_coluna FROM nome_da_tabela WHERE ano < 2019 AND totalaula > 40;
SELECT nome_da_coluna, nome_da_coluna, nnome_da_coluna FROM cursos WHERE ano < 2019 or totalaula > 40;

--OPERADOR IN
SELECT * FROM nome_da_tabela WHERE nome_da_coluna IN ('informação_da_coluna', 'informação_da_coluna');
SELECT nome_da_coluna, nome_da_coluna FROM nome_da_tabela WHERE totalaula IN (35,36);

--OPERADOT LIKE = parecido / % = caractere coringa
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE'%nome_para_pesquisar%';

-- pesquisa o p no inicio da palavra
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE 'p%'; -- 

-- pesquisa o a no final da palavra
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE '%a';

-- pesquisa o a em qualquer lugar
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE '%a%';

-- pesquisa tudo que não tiver a
SELECT * FROM nome_da_tabela WHERE nome_da_coluna NOT LIKE '%a%';

-- pesquisa tudo que começa com p e termine n
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE 'p%n';
1
-- pesquisa tudo que começa com p e termine n e + caractere
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE 'p%n_'; -- '_' sublinhado wild card

--INDEX
SHOW INDEX FROM tabela_de_produtos;
EXPLAIN SELECT * FROM tabela_de_produtos WHERE nome_do_produto = 'springer';
CREATE INDEX idx_tabela_de_produtos ON tabela_de_produtos (nome_do_produto);
DROP INDEX idx_tabela_de_produtos ON tabela_de_produtos;

--REGEXP - PESQUISA
SELECT * FROM tabela_de_vendedores WHERE nome regexp '[a]$';
SELECT * FROM tabela_de_vendedores WHERE nome regexp '^[mc]';
SELECT * FROM tabela_de_vendedores WHERE nome regexp '^[mc]|robs';
SELECT * FROM tabela_de_vendedores WHERE nome regexp '^[^mc]'; --^dentro do cochetes vira negação

--PESQUISA POR DATA
SELECT nome_da_coluna, nome_da_coluna FROM nome_da_tabela WHERE year(nome_da_coluna) = 2016 ;

--AS - ALIAS 
SELECT nome_da_coluna AS apelido, matricula AS ID FROM nome_da_tabela WHERE nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca';
SELECT nome_da_coluna AS apelido, matricula AS ID FROM nome_da_tabela WHERE NOT (nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca');



--AND e OR - Operadores Lógicos 
SELECT * FROM nome_da_tabela WHERE nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca';
SELECT * FROM nome_da_tabela WHERE NOT (nome_da_coluna = '00235' or nome_da_coluna = 'tijuca');

--Distinct
SELECT DISTINCT nome_da_coluna FROM nome_da_tabela;
SELECT DISTINCT nome_da_coluna, nome_da_coluna FROM nome_da_tabela WHERE nome_da_coluna = 'informação da tabela';

--LIMIT
SELECT * FROM nome_da_tabela LIMIT 5; -- limita até 5 linhas na pesquisa
SELECT * FROM nome_da_tabela LIMIT 2,15; -- começa da linha 2 da pesquisa e vai até a linha 15

--FUNÇÃO DE AGREGAÇÃO
SELECT max(carga) FROM cursos;
SELECT min(carga) FROM cursos;
SELECT sum(carga) FROM cursos;
SELECT avg(carga) FROM cursos;
SELECT embalagem, MAX(preco_de_lista) AS maior_preco FROM tabela_de_produtos GROUP BY embalagem;
SELECT embalagem, MIN(preco_de_lista) AS menor_preco FROM tabela_de_produtos GROUP BY embalagem;
SELECT embalagem, SUM(preco_de_lista) AS soma_preco FROM tabela_de_produtos GROUP BY embalagem;
SELECT embalagem, AVG(preco_de_lista) AS media_preco FROM tabela_de_produtos GROUP BY embalagem;
SELECT embalagem, COUNT(preco_de_lista) AS contar_preco FROM tabela_de_produtos GROUP BY embalagem;

--GROUP BY
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'GROUP BY ESTADO, BAIRRO;
SELECT bairro, count(*) FROM tabela_de_vendedores GROUP BY bairro;

--PESQUISAR POR DATA
SELECT * FROM (Nome da tabela) WHERE year(nome da coluna) = 1984

--HAVING
SELECT cidade, sum(idade) AS total FROM tabela_de_clientes GROUP BY cidade HAVING total < 170;
SELECT cidade, sum(idade) AS total FROM tabela_de_clientes GROUP BY cidade HAVING sum(idade) < 170;

--IF"
SELECT preco, IF (preco < 6.000, "Preço Baixo", "Preço Alto") AS Situacao FROM itens_notas_fiscais;

--CASE
SELECT preco,
CASE 
	WHEN preco <= 6.309 THEN 'Preço baixo'
    WHEN (preco > 6.309) AND (preco <= 9.0105) THEN 'Preço Justo'
    WHEN preco > 9.0106 THEN 'Preço Cara'
END AS Situação FROM itens_notas_fiscais;

--UNION
SELECT DISTINCT bairro 'Vendendor' AS tipo FROM tabela_de_vendedores UNION SELECT DISTINCT bairro 'Clientes' AS tipo FROM tabela_de_clientes;
SELECT DISTINCT bairro FROM tabela_de_vendedores UNION ALL SELECT DISTINCT bairro FROM tabela_de_clientes;

--SUBCONSULTAS
SELECT * FROM tabela_de_clientes WHERE bairro IN (SELECT DISTINCT bairro FROM tabela_de_vendedores);

EXPLAIN - View é uma tabela Lógica, resultado de uma consulta, que pode ser usada em qualquer outra consulta
CREATE view vw_clientes AS SELECT * FROM tabela_de_vendedores;
DROPCT * FROM vw_clientes;
DROP View vw_clientes;

--CONCAT
SELECT concat ('Robson', 'José de souza') AS 'Meu nome'
SELECT concat(nome,' ', bairro) AS nome FROM tabela_de_vendedores;
SELECT concat('Robson',' ', bairro) AS nome FROM tabela_de_vendedores WHERE matricula = 00235;
--IFNULL - Caso tivel um valor nulo.
SELECT concat('Robson',' ', ifnull(bairro, 0)) FROM tabela_de_vendedores WHERE matricula = 00235;
--COALESCE
SELECT concat('Robson',' ', coalesce(null,bairro,null, 0)) FROM tabela_de_vendedores WHERE matricula = 00235;

--OPERADOR ARITMÉTICOS
SELECT 3*9 AS soma;
SELECT 3*9/3 AS soma;
SELECT numero * 2 AS total FROM notas_fiscais;
SELECT datediff(current_timestamp(), '1984-08-20') AS Dias_de_vida;
SELECT cpf, floor(numero * 2) AS total FROM notas_fiscais;

EXPLAINO
CREATE	function soma (a INT, b INT) returns float deterministic return round ((a* b) ,2);
DROPCT soma(3,4);
SELECT ltrim('    robson jose') AS retirar; -- string
SELECT adddate('2022-05-31', interval 10 day); -- date
SELECT datediff(current_timestamp(), '1984-08-20') AS Dias_de_vida;
SELECT datediff(current_timestamp(), '1984-08-20') AS Dias_de_vida;--ARITMÉTICOS

--MANIPULAÇÃO DE DADOS
SELECT concat('O dia de hoje é: ', date_format(current_timestamp(), '%m/%Y')) AS resultado;