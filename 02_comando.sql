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

create database consulta -- cria um novo banco de dados
	default character set utf8 -- padrão de acentuação 
    default collate utf8_general_ci;

use consulta; -- acessar o banco de dados consulta

create table pessoas( -- criar tabela para banco de dados
	id int not null auto_increment, -- não precisa dar a informação. o BD irá colocar automáticamente
	nome varchar (30),
	nascimento date,
	sexo enum ('F', 'M'),
	peso decimal (5, 2),
	altura decimal (3,2),
	nascionalidade varchar (30) default 'Brasil', -- default - caso não colocar a informação o BD irá colocar o padrão
	primary key (id) -- coloca a chave primária para a tabela
) default charset = utf8;

create table if not exists cursos(   -- if not exists - caso tiver uma tabela cursos o BD não deixará sobrescrever
	nome varchar(30) not null unique,  -- not null obriga escrever no campo - Constranger unique/ terá um nome apenas no registro
	descricao text,
	carga int unsigned,  -- unsigned - não poderá ter sinais no registro
	totalaula int unsigned,
	ano year default '2022'
) default charset = utf8;  -- charset - para não termos problema de acentuaçãoptimize

show databases; -- mostrar todos bancos existentes
show tables; -- mostrar todas tabelas exitentes no schema
describe tabela; -- mostras as infomações da tabela
drop database databases; -- excluir um banco/schema

-- inserir dados do usuário
insert into nome_da_tabela
	(id, nome, nascimento, sexo, peso, altura, nascionalidade) -- todos os campos da tabela
values
	(default, 'Robson', '1984-08-20', 'M', '84.0', '1.79', 'Brasil');

select * from nome_da_tabela;

-- inserir usuários quando todas as informções forem padrão
insert into nome_da_tabela values
	(default, 'Ana', '1982-10-24', 'F', '56.0', '1.62', 'Brasil');

-- inserir varios usuários no banco
insert into nome_da_tabela values
	(default, 'Sofia Souza', '2016-03-21', 'F', '25.0', '1.20', 'Brasil'),
    (default, 'Iris Souza', '1961-08-17', 'F', '60.0', '1.57', 'Brasil');

-- acrescentando coluna na tabela 
alter table nome_da_tabela
add column nome_da_coluna varchar (10);

-- acrescentando coluna na tabela escolhendo a posição 
alter table nome_da_tabela
add column nome_da_coluna varchar (10) after nome;

-- acrescentando coluna na tabela escolendo a primeira posião da tabela
alter table nome_da_tabela
add column nome_da_coluna int first;

-- excluir coluna da tabela
alter table nome_da_tabela
drop column nome_da_coluna;

-- modificando as informações da coluna/campo da tabela
alter table nome_da_tabela
modify column nome_da_coluna varchar(20) default '';

-- modificando no nome da coluna
alter table nome_da_tabela
change column nome_da_coluna nome_para_modificar varchar(15) default 'Brasil' not null;

-- modificar o nome da tabela
alter table nome_da_tabela
rename to nome_para_modificar;

-- modificar a posição para primeiro
alter table nome_da_tabela -- alter table - comando para manipular colunas
add column nome_da_coluna int first;

-- add a chave primária
alter table nome da tabela
add primary key(nome da colula que será chave primária);

-- apagar a tabela
drop table if exists nome da tabela;

-- mudar os registros - Update --> Comando para moficar a linha da tabela
update nome da tabela
set nome_da_coluna = 'robson'
where nome_da_coluna = 1;

-- mudar dois regitro ou mais - sempre na mesma lina
update nome_da_tabela
set nome_da_coluna = 'Mysql' , nome_da_coluna = 'YouTube'
where nome_da_coluna = 1
limit = 1; -- limitar a alteração para apenas uma linha, tirando o risco de fazer mudança em outra linha

--modificar mais de duas linhas
update nome_da_tabela
	set nome_da_coluna = 'robson'
	where nome_da_tabela = 1

-- remover linhas da tabela
delete from nome_da_tabela
where idcurso = '8'

-- deletar mais de um linha
delete from cursos
where idcurso = 2022 -- Se na tabela tiver mais de um usuário tiver no campo o ano 2022	

-- todas linhas de tabela
truncate table cursos	

						-- COMANDOS USANDO SELECT--
						
-- orderna a table pela colula
select * from cursos
order by nome;

-- orderna a table pela coluna de baixo para cima
select * from cursos
order by nome desc;

-- selecionar coluna
select idcurso, nome, ano from cursos -- posso colocar os campos invertidos
order by nome, ano; -- qual coluna devo ordenar a consulta

-- pesquisar o banco por linhas
select * from nome_da_tabela
where nome_da_tabela = '1'
order by nome_da_tabela;




select ano, idcurso from cursos
where idcurso = '1'
order by nome;

select ano, idcurso,curso from cursos
where idcurso > '1'
order by nome;

-- operadores relacionais - =, <,>,<=,>=,!=,<> 

select idcurso from cursos
where nome between 7 and 10;

select nome, totalaula from cursos
where totalaula in (35,36);

select ano, totalaula, nome from cursos
where ano < 2019 and totalaula > 40;

select ano, totalaula, nome from cursos
where ano < 2019 or totalaula > 40;

-- pesquisa o p no inicio da palavra
select * from cursos
where nome like 'p%'; -- Operador 'like = parecido' '% = caractere coringa

-- pesquisa o a no final da palavra
select * from cursos
where nome like '%a';

-- pesquisa o a em qualquer lugar
select * from cursos
where nome like '%a%';

-- pesquisa tudo que não tiver a
select * from cursos
where nome not like '%a%';

-- pesquisa tudo que começa com p e termine n
select * from cursos
where nome like 'p%n';

-- pesquisa tudo que começa com p e termine n e + caractere
select * from cursos
where nome like 'p%n_'; -- '_' sublinhado wild card

-- traz apenas o resumo
select descricao from cursos;
select distinct descricao from cursos
order by descricao;

-- funçao de agregação
select * from cursos order by totalaula;
select count(*) from cursos;
select count(*) from cursos where totalaula > 30;

-- maior
select max(carga) from cursos;

-- min
select min(carga) from cursos;

-- soma
select sum(carga) from cursos;

-- média
select avg(carga) from cursos;


select nacionalidade, count(*) from familia -- contar a quantidade de vezes que aparece a informação na tabela
group by nacionalidade
order by nacionalidade;
select * from familia where nacionalidade = 'brasil';


select peso, count(*) from familia
group by peso
having peso >= '62.00';

--mudar o nome da coluna da tabela no select
select * from tbcliente;
select nome as nome_pri from tbcliente;

-- pesquisar data de nascimento
select * from (Nome da tabela) where year(nome da coluna) = 1984

-- foreign Key--
 