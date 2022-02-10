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

show databases; -- mostrar todos bancos existentes
show tables; -- mostrar todas tabelas exitentes no schema
describe pessoas; -- mostras as infomações da tabela
drop database consulta; -- excluir um banco/schema

-- inserir dados do usuário
insert into pessoas
	(id, nome, nascimento, sexo, peso, altura, nascionalidade) -- todos os campos da tabela
values
	(default, 'Robson', '1984-08-20', 'M', '84.0', '1.79', 'Brasil');

select * from pessoas;

-- inserir usuários quando todas as informções forem padrão
insert into pessoas values
	(default, 'Ana', '1982-10-24', 'F', '56.0', '1.62', 'Brasil');

-- inserir varios usuários no banco
insert into pessoas values
	(default, 'Sofia Souza', '2016-03-21', 'F', '25.0', '1.20', 'Brasil'),
    (default, 'Iris Souza', '1961-08-17', 'F', '60.0', '1.57', 'Brasil');

-- acrescentando coluna na tabela 
alter table pessoas
add column profissao varchar (10);

-- acrescentando coluna na tabela escolendo a posição 
alter table pessoas
add column profissao varchar (10) after nome;

-- acrescentando coluna na tabela escolendo a primeira posião da tabela
alter table pessoas
add column codigo int first;

-- excluir coluna da tabela
alter table pessoas
drop column profissao;

-- modificando as informações da coluna/campo da tabela
alter table pessoas
modify column profissao varchar(20) default '';

-- modificando no nome da coluna
alter table pessoas
change column nascionalidade nacionalidade varchar(15) default 'Brasil' not null;

-- modificar o nome da tabela
alter table pessoas
rename to familia;

describe familia;
select * from pessoas;

use consulta;


create table if not exists cursos(   -- if not exists - caso tiver uma tabela cursos o BD não deixará sobrescrever
nome varchar(30) not null unique,  -- not null obriga escrever no campo - Constranger unique/ terá um nome apenas no registro
descricao text,
carga int unsigned,  -- unsigned - não poderá ter sinais no registro
totalaula int unsigned,
ano year default '2022'
) default charset = utf8;  -- charset - para não termos problema de acentuaçãoptimize

-- modificar a posição para primeiro
alter table cursos
add column idcurso int first;

-- add a chave primária
alter table cursos
add primary key(idcurso);

-- apagar a tabela
drop table if exists teste;

-- mudar os registros
update cursos
set nome = 'Guanabara'
where idcurso = '1';

-- mudar dois regitro ou mais
update cursos
set nome = 'Mysql' , descricao = 'YouTube'
where idcurso = 1
limit = 1; -- limitar a alteração para apenas uma linha, tirando o risco de fazer mudança em outra linha

--modificar mais de duas linhas
update cursos

-- remover linhas da tabela
delete from cursos
where idcurso = '8'

-- deletar masi de um linha
delete from cursos
where idcurso = 2022 

-- todas linhas de tabela
truncate table cursos