-- Acessando o mysql pelo terminal do Linux
	mysql -h localhost -u root -p
-- Dump do banco de dados
	server
	data export
	
-- Autorizar Drop do Data Base
	edit
	preferences
	SQL Editor
	safe Updates(rejects Updates and Deletes with no restrictions)

CREATE database consulta -- cria um novo banco de dados
	DEFAULT character SET utf8 -- padrão de acentua ão 
    DEFAULT collate utf8_general_ci;

USE consulta; -- acessar o banco de dados consulta

CREATE TABLE pessoas( -- criar tabela para banco de dados
	id int not null auto_increment, -- não precisa dar a informação. o BD irá colocar automáticamente
	nome VARCHAR (30),
	nascimento date,
	sexo enum ('F', 'M'),
	peso decimal (5, 2),
	altura decimal (3,2),
	nascionalidade VARCHAR (30) DEFAULT 'Brasil', -- DEFAULT - caso não colocar a informação o BD irá colocar o padrão
	PRIMARY KEY (id) -- coloca a chave primária para a tabela
) DEFAULT charset = utf8;

CREATE TABLE if not EXISTS cursos(   -- if not EXISTS - caso tiver uma tabela cursos o BD não deixará sobrescrever
	nome VARCHAR(30) not null unique,  -- not null obriga escrever no campo - Constranger unique/ terá um nome apenas no registro
	descricao text,
	carga int unsigned,  -- unsigned - não poderá ter sinais no registro
	totalaula int unsigned,
	ano year DEFAULT '2022'
) DEFAULT charset = utf8;  -- charset - para não termos problema de acentuaçãoptimize

show databases; -- mostrar todos bancos existentes
show tables; -- mostrar todas tabelas exitentes no schema
describe tabela; -- mostras as infomações da tabela
DROP database databases; -- excluir um banco/schema

-- inserir dados do usuário
INSERT INTO nome_da_tabela
	(id, nome, nascimento, sexo, peso, altura, nascionalidade) -- todos os campos da tabela
VALUES
	(DEFAULT, 'Robson', '1984-08-20', 'M', '84.0', '1.79', 'Brasil');

SELECT * FROM nome_da_tabela;

-- inserir usuários quando todas as informções forem padrão
INSERT INTO nome_da_tabela VALUES
	(DEFAULT, 'Ana', '1982-10-24', 'F', '56.0', '1.62', 'Brasil');

-- inserir varios usuários no banco
INSERT INTO nome_da_tabela VALUES
	(DEFAULT, 'Sofia Souza', '2016-03-21', 'F', '25.0', '1.20', 'Brasil'),
    (DEFAULT, 'Iris Souza', '1961-08-17', 'F', '60.0', '1.57', 'Brasil');

-- acrescentando coluna na tabela 
ALTER TABLE nome_da_tabela ADD column nome_da_coluna VARCHAR (10);

-- acrescentando coluna na tabela escolhendo a posição 
ALTER TABLE nome_da_tabela ADD column nome_da_coluna VARCHAR (10) AFTER nome;

-- acrescentando coluna na tabela escolendo a primeira posião da tabela
ALTER TABLE nome_da_tabela ADD column nome_da_coluna INT FIRST;

-- excluir coluna da tabela
ALTER TABLE nome_da_tabela DROP column nome_da_coluna;

-- modificando as informações da coluna/campo da tabela
ALTER TABLE nome_da_tabela MODIFY column nome_da_coluna VARCHAR(20) DEFAULT '';

-- modificando no nome da coluna
ALTER TABLE nome_da_tabela change column nome_da_coluna nome_para_modificar VARCHAR(15) DEFAULT 'Brasil' not null;

-- modificar o nome da tabela
ALTER TABLE nome_da_tabela rename TO nome_para_modificar;

-- modificar a posição para primeiro
ALTER TABLE nome_da_tabela ADD column nome_da_coluna INT FIRST;

-- ADD a chave primária
ALTER TABLE nome da tabela ADD PRIMARY KEY(nome da colula que será chave primária);

-- apagar a tabela
DROP TABLE IF EXISTS nome da tabela;

-- mudar os registros - Update --> Comando para moficar a linha da tabela
UPDATE nome da tabela SET nome_da_coluna = 'robson' WHERE nome_da_coluna = 1;

 -- mudar dois regitro ou mais - sempre na mesma lina
UPDATE nome_da_tabela SET nome_da_coluna = 'Mysql' nome_da_coluna = 'YouTube' WHERE nome_da_coluna = 1
limit = 1; -- limitar a alteração para apenas uma linha, tirando o risco de fazer mudança em outra linha

--modificar mais de duas linhas
UPDATE nome_da_tabela 	SET nome_da_coluna = 'robson' WHERE nome_da_tabela = 1

 -- remover linhas da tabela
DELETE FROM nome_da_tabela WHERE idcurso = '8'

-- deletar mais de um linha
DELETE FROM cursos WHERE i curso = 2022 -- Se na tabela tiver mais de um usuário tiver no campo o ano 2022	

-- todas linhas de tabela
truncate TABLE cursos	

						-- COMANDOS USANDO SELECT--

-- Ordenar tabela order by					
SELECT * FROM tabela_de_produtos order by preco_de_lista; -- orderna a TABLE pela colula - order by
SELECT * FROM tabela_de_produtos order by preco_de_lista desc; -- orderna a TABLE pela coluna de baixo para cima
SELECT * FROM tabela_de_produtos order by sabor, preco_de_lista; -- ordenar primeiro pela coluna sabor e depois preço

-- selecionar coluna
SELECT idcurso, nome, ano FROM cursos -- posso colocar os campos invertidos

-- pesquisar o banco por linhas
SELECT * FROM nome_da_tabela WHERE nome_da_coluna = '1'
SELECT nome_da_coluna, nome_da_coluna FROM nome_da_tabelas WHERE nome_da_coluna = '1'
SELECT nome_da_coluna, nome_da_coluna,nome_da_coluna FROM nome_da_tabela WHERE nome_da_coluna > '1'

-- operadores relacionais - =, <,>,<=,>=,!=,<> 
SELECT idcurso FROM cursos WHERE nome between 7 and 10;
SELECT nome, totalaula FROM cursos WHERE totalaula in (35,36);
SELECT ano, totalaula, nome FROM cursosWHERE ano < 2019 and totalaula > 40;

SELECT ano, totalaula, nome FROM cursos
WHERE ano < 2019 or totalaula > 40;

-- Pesquisa com Like / Operador 'LIKE = parecido' / % = caractere coringa
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE'%nome_para_pesquisar%';

-- pesquisa o p no inicio da palavr a
SELECT * FROM nome_da_tabela

WHERE nome_da_coluna LIKE 'p%'; -- 

-- pesquisa o a no final da palavra
SELECT * FROM nome_da_tabela WHERE nome LIKE '%a';

-- pesquisa o a em qualquer lugar
SELECT * FROM nome_da_tabela WHERE nome LIKE '%a%';

-- pesquisa tudo que não tiver a
SELECT * FROM nome_da_tabela WHERE nome not LIKE '%a%';

-- pesquisa tudo que começa com p e termine n
SELECT * FROM nome_da_tabela WHERE nome LIKE 'p%n';

-- pesquisa tudo que começa com p e termine n e + caractere
SELECT * FROM nome_da_tabela WHERE nome LIKE 'p%n_'; -- '_' sublinhado wild card

-- Trocar o nome da coluna da tabela quando pesquisamos - AS
SELECT nome_da_coluna AS apelido, matricula AS ID FROM nome_da_tabela WHERE nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca';
SELECT nome_da_coluna AS apelido, matricula AS ID FROM nome_da_tabela WHERE NOT (nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca');

-- Operador in - Irá trazer todas informação que coNtem na pesquisa
SELECT * FROM nome_da_tabela WHERE nome_da_coluna IN ('informação_da_coluna', 'informação_da_coluna');

-- Operadores Lógicos And e OR 
SELECT * FROM nome_da_tabela WHERE nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca';
SELECT * FROM nome_da_tabela WHERE NOT (nome_da_coluna = '00235' or nome_da_coluna = 'tijuca');

-- Distinct - traz apenas o resumo 
SELECT distinct nome_da_coluna FROM nome_da_tabela;
SELECT distinct nome_da_coluna, nome_da_coluna FROM nome_da_tabela WHERE nome_da_coluna = 'informação da tabela';

-- Limitar a quantidade de linhas da pesquisa - Limit
SELECT * FROM nome_da_tabela limit 5; -- limita até 5 linhas na pesquisa
SELECT * FROM nome_da_tabela limit 2,15; -- começa da linha 2 da pesquisa e vai até a linha 15

-- funçao de agregação
SELECT * FROM cursos order by totalaula; SELECT count(*) FROM cursos; SELECT count(*) FROM cursos WHERE totalaula > 30;

-- maior
SELECT max(carga) FROM cursos;

-- min
SELECT min(carga) FROM cursos;

-- soma
SELECT sum(carga) FROM cursos;

-- média
SELECT avg(carga) FROM cursos;

-- pesquisar data de nascimento
SELECT * FROM (Nome da tabela) WHERE year(nome da coluna) = 1984



