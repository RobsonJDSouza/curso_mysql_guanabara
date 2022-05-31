--Verificar os usuário
select user from mysql.user;

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

-- Criar um banco de dados
CREATE database nome_do_banco 
DEFAULT character SET utf8 -- padrão de acentuaão 
DEFAULT collate utf8_general_ci;

--CONSULTA BANCO
USE nome_do_banco
SHOW databases; 

 -- criar tabela para banco de dados
CREATE TABLE if not EXISTS nome_da_tabela( -- if not EXISTS - caso tiver uma tabela cursos o BD não deixará sobrescrever
	id int not null auto_increment, -- não precisa dar a informação. O BD irá colocar automáticamente
	nome VARCHAR (30) not null unique, -- not null obriga escrever no campo - Constranger unique/ terá um nome apenas no registro
	nascimento date,
	sexo enum ('F', 'M'),
	carga int unsigned,  -- unsigned - não poderá ter sinais no registro
	peso decimal (5, 2),
	altura decimal (3,2),
	nacionalidade VARCHAR (30) DEFAULT 'Brasil', -- DEFAULT - caso não colocar a informação o BD irá colocar o padrão
	PRIMARY KEY (id) -- coloca a chave primária para a tabela
) DEFAULT charset = utf8; -- charset - para não termos problema de acentuaçãoptimize

show databases;
show tables;
use nome_do_banco;
describe nome_da_tabela;

-- excluir um banco/schema
DROP database nome_do_banco;

-- inserir dados do usuário
INSERT INTO nome_da_tabela
	(id, nome, nascimento, sexo, peso, altura, nascionalidade) -- todos os campos da tabela
VALUES
	(DEFAULT, 'Robson', '1984-08-20', 'M', '84.0', '1.79', 'Brasil');

-- inserir usuários quando todas as informções forem padrão
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
alter table carro add column fk_id_pessoa int;
alter table carro add foreign key (fk_id_pessoa) references carro(id_carro);

-- acrescentando coluna na tabela 
ALTER TABLE nome_da_tabela ADD column nome_da_coluna VARCHAR (10);

-- acrescentando coluna na tabela escolhendo a posição 
ALTER TABLE nome_da_tabela ADD column nome_da_coluna VARCHAR (10) AFTER nome_da_coluna;

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

-- apagar a tabela
DROP TABLE IF EXISTS nome da tabela;

-- mudar os registros - Update --> Comando para moficar a linha da tabela
UPDATE nome da tabela SET nome_da_coluna = 'robson' WHERE nome_da_coluna = 1;

 -- mudar dois regitro ou mais - sempre na mesma lina
UPDATE nome_da_tabela SET nome_da_coluna = 'Mysql' nome_da_coluna = 'YouTube' WHERE nome_da_coluna = 1
limit = 1; -- limitar a alteração para apenas uma linha, tirando o risco de fazer mudança em outra linha

--modificar mais de duas linhas
UPDATE nome_da_tabela SET nome_da_coluna = 'robson' WHERE nome_da_coluna = 1

 -- remover linhas da tabela
DELETE FROM nome_da_tabela WHERE idcurso = '8'

-- deletar mais de um linha
DELETE FROM cursos WHERE i curso = 2022 -- Se na tabela tiver mais de um usuário tiver no campo o ano 2022	

-- deletar todas linhas de tabela
truncate TABLE cursos	

-- COMANDOS USANDO SELECT

-- Selecionar do tabela
SELECT * FROM nome_da_tabela;

-- Orderna a TABLE pela colula - order by				
SELECT * FROM tabela_de_produtos order by preco_de_lista; 

-- Orderna a TABLE pela coluna de baixo para cima
SELECT * FROM tabela_de_produtos order by preco_de_lista desc; 

-- ordernar primeiro pela coluna sabor e depois preço
SELECT * FROM tabela_de_produtos order by sabor, preco_de_lista; 

--ordernar a primeira coluna ascendente e a segunda descendente
SELECT * FROM tabela_de_produtos ORDER BY sabor ASC, preco_de_lista DESC; 

-- selecionar coluna
SELECT idcurso, nome, ano FROM cursos -- posso colocar os campos invertidos

-- pesquisar o banco por linhas
SELECT * FROM nome_da_tabela WHERE nome_da_coluna = '1'
SELECT nome_da_coluna, nome_da_coluna FROM nome_da_tabelas WHERE nome_da_coluna = '1'
SELECT nome_da_coluna, nome_da_coluna,nome_da_coluna FROM nome_da_tabela WHERE nome_da_coluna > '1'

-- operadores relacionais - =, <,>,<=,>=,!=,<> 
SELECT nome_da_coluna FROM nome_da_tabela WHERE nome between 7 and 10;
SELECT nome_da_coluna, nome_da_coluna, nome_da_coluna FROM nome_da_tabela WHERE ano < 2019 and totalaula > 40;
SELECT nome_da_coluna, nome_da_coluna, nnome_da_coluna FROM cursos WHERE ano < 2019 or totalaula > 40;

--OPERADOR IN
SELECT * FROM nome_da_tabela WHERE nome_da_coluna IN ('informação_da_coluna', 'informação_da_coluna');
SELECT nome_da_coluna, nome_da_coluna FROM nome_da_tabela WHERE totalaula in (35,36);

--OPERADOT LIKE = parecido / % = caractere coringa
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE'%nome_para_pesquisar%';

-- pesquisa o p no inicio da palavra
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE 'p%'; -- 

-- pesquisa o a no final da palavra
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE '%a';

-- pesquisa o a em qualquer lugar
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE '%a%';

-- pesquisa tudo que não tiver a
SELECT * FROM nome_da_tabela WHERE nome_da_coluna not LIKE '%a%';

-- pesquisa tudo que começa com p e termine n
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE 'p%n';
1
-- pesquisa tudo que começa com p e termine n e + caractere
SELECT * FROM nome_da_tabela WHERE nome_da_coluna LIKE 'p%n_'; -- '_' sublinhado wild card

--REGEXP - PESQUISA
select * from tabela_de_vendedores where nome regexp '[a]$';
select * from tabela_de_vendedores where nome regexp '^[mc]';
select * from tabela_de_vendedores where nome regexp '^[mc]|robs';
select * from tabela_de_vendedores where nome regexp '^[^mc]'; --^dentro do cochetes vira negação

--PESQUISA POR DATA
select nome_da_coluna, nome_da_coluna from nome_da_tabela where year(nome_da_coluna) = 2016 ;

--AS - ALIAS 
SELECT nome_da_coluna AS apelido, matricula AS ID FROM nome_da_tabela WHERE nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca';
SELECT nome_da_coluna AS apelido, matricula AS ID FROM nome_da_tabela WHERE NOT (nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca');



--AND e OR - Operadores Lógicos 
SELECT * FROM nome_da_tabela WHERE nome_da_coluna = '00235' AND nome_da_coluna = 'tijuca';
SELECT * FROM nome_da_tabela WHERE NOT (nome_da_coluna = '00235' or nome_da_coluna = 'tijuca');

--Distinct
SELECT distinct nome_da_coluna FROM nome_da_tabela;
SELECT distinct nome_da_coluna, nome_da_coluna FROM nome_da_tabela WHERE nome_da_coluna = 'informação da tabela';

--LIMIT
SELECT * FROM nome_da_tabela limit 5; -- limita até 5 linhas na pesquisa
SELECT * FROM nome_da_tabela limit 2,15; -- começa da linha 2 da pesquisa e vai até a linha 15

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
select bairro, count(*) from tabela_de_vendedores group by bairro;

--PESQUISAR POR DATA
SELECT * FROM (Nome da tabela) WHERE year(nome da coluna) = 1984

--HAVING
select cidade, sum(idade) as total from tabela_de_clientes group by cidade having total < 170;
select cidade, sum(idade) as total from tabela_de_clientes group by cidade having sum(idade) < 170;

--IF"
select preco, if (preco < 6.000, "Preço Baixo", "Preço Alto") as Situacao From itens_notas_fiscais;

--CASE
select preco,
case 
	when preco <= 6.309 then 'Preço baixo'
    when (preco > 6.309) and (preco <= 9.0105) then 'Preço Justo'
    when preco > 9.0106 then 'Preço Cara'
end as Situação from itens_notas_fiscais;

--UNION
select distinct bairro 'Vendendor' as tipo from tabela_de_vendedores union select distinct bairro 'Clientes' as tipo from tabela_de_clientes;
select distinct bairro from tabela_de_vendedores union all select distinct bairro from tabela_de_clientes;

--SUBCONSULTAS
select * from tabela_de_clientes where bairro in (select distinct bairro from tabela_de_vendedores);

--VISÃO - View é uma tabela Lógica, resultado de uma consulta, que pode ser usada em qualquer outra consulta
create view vw_clientes as select * from tabela_de_vendedores;
select * from vw_clientes;
DROP View vw_clientes;

--CONCAT
select concat ('Robson', 'José de souza') as 'Meu nome'
select concat(nome,' ', bairro) as nome from tabela_de_vendedores;
select concat('Robson',' ', bairro) as nome from tabela_de_vendedores where matricula = 00235;
--IFNULL - Caso tivel um valor nulo.
select concat('Robson',' ', ifnull(bairro, 0)) from tabela_de_vendedores where matricula = 00235;
--COALESCE
select concat('Robson',' ', coalesce(null,bairro,null, 0)) from tabela_de_vendedores where matricula = 00235;

--OPERADOR ARITMÉTICOS
select 3*9 as soma;
select 3*9/3 as soma;
select numero * 2 as total from notas_fiscais;
select cpf, ceiling(numero * 2) as total from notas_fiscais;
select cpf, floor(numero * 2) as total from notas_fiscais;

--FUNÇÃO
create	function soma (a int, b int) returns float deterministic return round ((a* b) ,2);
select soma(3,4);