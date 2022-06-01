 DDL - Data Definition Language
    create database
    create table
    alter table
    drop table

 DML - Data Manipulation Language
    insert into
    update
    delete
    truncate
DQL - Data query language
    select

 Dump
    Backup do Banco de dados
    
 Tipos Primitivos
    https://elias.praciano.com/2014/01/mysql-tipos-de-dados/

 Banco de dados
    Ele é um repositório que armazena dados que podem ser recuperados. Esse banco de dados normalmente fica armazenado dentro de uma área de disco rígido, pode ser um disco normal, SSD. Ou seja, ele ocupa espaço em disco como um arquivo de Word, como uma planilha de Excel.

 (SGBDR) - Sistema Gerenciador de Banco de Dados Relacional 
 (RDBMS) - Relational database management system 
    É utilizado para pesquisa, criação, alteração, estrutura, manipulação da estrutura do banco de dados, forma como o banco de dados interage com a segurança e assim por diante.
Relacionamento entre tabelas
    Consiste em uma coleção de dados inter-relacionados e em um conjunto de programas para acessá-los
SGBDs são projetados para gerenciar grandes grupos de informações

 SEQUEL - Structured English Query Language.
    Linguagem de banco de dados relacional

 IDE - WorkBench
    Interface gráfica - Visualização de forma interativa o banco de dados

 Entidades
    Dentro do banco de dados, temos diversas entidades. São estruturas que organizam o armazenamento do dado dentro do banco de dados. A entidade principal, entre outras, é a tabela. Ou seja, um banco de dados tem dentro dele uma coleção de tabelas.

 Tabela
    Quando criamos uma tabela, temos que informar quantos campos temos e o tipo de cada campo.
    Cada linha da tabela chamamos de registro. O número de campos é limitado, mas o número de registro pode ser ilimitado.

 Chave primária
    Ao criar a um campo e informamos que uma chave primária, não poderemos ter um informação repetida. ex. CPF igual no mesmo campo.

 Chave estrangeira
    Relacionamento entre tabelas.
    Se eu crio uma chave estrangeira entre o campo CPF, que está na tabela que mostra as vendas e o campo CPF que está no cadastro de clientes, isso significa que há uma ligação entre essas duas tabelas. E aí não vou poder ter um CPF de cliente na tabela de vendas que não tenha sido previamente cadastrado na tabela de clientes.

 Índice
    No contexto da estrutura de dados, é uma referência associada a uma chave, que é utilizada para fins de otimização, permitindo uma localização mais rápida de um registro quando efetuada uma consulta.

 Esquemas
    O projeto geral do banco de dados.

 DER
    Diagrama Entidade Relacionamento

 View
    As views não são agrupadores de tabelas, e sim consultas que podem ou não conter várias tabelas.
    É um conjunto resultado de uma consulta armazenada sobre os dados, em que os usuários do banco de dados podem consultar simplesmente como eles fariam em um objeto de coleção de banco de dados persistente. Este comando de consulta pré-estabelecido é armazenado no dicionário de banco de dados.

 Filtro
    A filtragem é uma maneira útil de ver apenas os dados que você deseja exibir nos bancos de dado

 Procedures
    Fazemos programas para manipular dados do banco.
    Uma procedure é um bloco de comandos ou instruções SQL organizados para executar uma ou mais tarefas. Ela pode ser utilizada para ser acionada através de uma chamada simples que executa uma série de outros comandos.
    Funções

 Trigger 
Alerta no banco de dados. 

 rigistro = Tuplas

SQL Constraints (Restrições)
    São regras aplicadas nas colunas de uma Tabela
    São usadas para limitar os tipos de dados que são inseridos.
    Podem ser especificadas no momento de ciração de tabela (Create) ou após a tabela ter sido criada (Alter)
        Principais
        * Not null
        * unique
        * Primary Key
        * Foreign Key
        * Default
Entidade 
Atributos - Função que mapeia um conjunto de entidades em um domínio. Ex Entidade pessoa tem (Id, nome, endereço, altura)
Relacionamento - è o relacionamento feito entre entidades
Cardinalidade  - define o grau de ralação entre entidades
    - n para n / muitos para muitos - Relacionamento vira 'n' Uma entidade - Depois é só fazer chave primária de 1 para n /
    - um para um - Entidade Dominante - A entidade dominante irá receber a chave estrangeira
    - um para muitos - Chave primaira de 1 joga para n



InnoDB 
    é um mecanismo de armazenamento para o MySQL. 
    O MySQL 5.5, e versões posteriores, o utilizam por padrão. Ele fornece as funcionalidades padrões de 
    transação complacentes com ACID, juntamente com o suporte a chave estrangeira (Integridade Referencial Declarativa).

ACID  
    atomicidade - toda tarefa é feita ou nada é conciderado
    consistente - antes de execurtar uma tarefa o banco estava ok, depois de executar essa tarefa ele terá que está ok
    isolamento - caso tenha uma tarefa sendo executado, caso execute outra tarefa, terá que ser feita isolada da outra. Sem interferência
    durabilidade - dado salvo não pode ser alterado. Nao pode perder dados do nada

HAVING 
    É uma condição (filtro) que se aplica ao resultado de uma agregação
Cláusula usada para especificar condições de filtragem em grupos de registros ou agregaçẽs.
É frequentimente usada com a cláusula GROUP BY para filtrar as colunas agrupadas
Sintaxe:

Cláusula usada para especificar condições de filtragem em grupos de registros ou agregaçẽs.
É frequentimente usada com a cláusula GROUP BY para filtrar as colunas agrupadas

Sintaxe:
Select coluna, sum() as (nome)
From tabela
where filtro
group by colunas
having filtro_agrupamento

Exemplo 1
SELECT bairro, COUNT(cidade) AS bairro 
FROM tabela_de_clientes
GROUP BY bairro
HAVING COUNT(bairro) >= 2;

 Exemplo 2
SELECT 
    sabor, COUNT(embalagem) AS sabor
FROM
    tabela_de_produtos
WHERE
    tamanho = '1,5 Litros'
GROUP BY sabor

HAVING COUNT(sabor) > 1;
Select coluna, função_agregação() as (nome)
From tabela
where filtro
group by colunas
having filtro_agrupamento


Blocos Condicionais
    Há dois tipos básicos de blocos condicionais
    if elseif else end if
    case when then else end case

    Sintaxe de um bloco IF
    IF condição THEN lista_declarações
        [ELSEIF condição THEN lista_declaração]
        
        [ELSE lista_declarações]
    END IF

Sintaxe de um bloco CASE
Fazemos um teste em um ou mias campos e, dependendo do resultadom, teremos um ou outro valor

CASE valor_referência
    WHEN valor_comparado THEN
lista_declarações
    WHEN valor_comparado THEN
lista_declarações

ELSE lista_declarações
END CASE;

JOIN
A Cláusula JOIN é usada para combinar dados provenientes de duas ou mais tabelas, baseado em uma relacionamento entre colunas destas tabelas.

Categorias
INNER JOIN: Retorna linhas quando houver pelo menos uma correspondência em ambas as tabelas
OUTER JOIN: Retorna linhas mesno quando não houver pelo menos uma correspondênci em uma das tabelas (ou ambas). Esse comando dividi-se em:
    - LEFT JOIN
    - RIGHT JOIN
    - FULL JOIN

Sintaxe:
SELECT colunas
From table1
INNER JOIN tabela2
ON tabela1.coluna=tabela2.coluna;

Exemplo1
select * from tabela_de_clientes
inner join tabela_de_vendedores
on cidade = matricula;

Exemplo2
select tabela_de_clientes.nome from tabela_de_clientes
inner join tabela_de_vendedores
on tabela_de_clientes.nome = tabela_de_vendedores.bairro;

Exemplo3
select c.nome from tabela_de_clientes as c
inner join tabela_de_vendedores as v
on c.nome = v.bairro;

-- SUBCONSULTAS
select * from tabela_de_clientes where bairro in (select distinct bairro from tabela_de_vendedores)



--FUNÇÓES
Documentação 
https://dev-mysql-com.translate.goog/doc/?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt-BR&_x_tr_pto=sc
https://www.w3schools.com/sql/
