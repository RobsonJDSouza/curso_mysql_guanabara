-- DDL - Data Definition Language
    create database
    create table
    alter table
    drop table

-- DML - Data Manipulation Language
    insert into
    update
    delete
    truncate
--DQL - Data query language
    select

-- Dump
    Backup do Banco de dados
    

-- Tipos Primitivos
    https://elias.praciano.com/2014/01/mysql-tipos-de-dados/

-- Banco de dados
    Ele é um repositório que armazena dados que podem ser recuperados. Esse banco de dados normalmente fica armazenado dentro de uma área de disco rígido, pode ser um disco normal, SSD. Ou seja, ele ocupa espaço em disco como um arquivo de Word, como uma planilha de Excel.

-- (SGBDR) - Sistema Gerenciador de Banco de Dados Relacional 
-- (RDBMS) - Relational database management system 
    É utilizado para pesquisa, criação, alteração, estrutura, manipulação da estrutura do banco de dados, forma como o banco de dados interage com a segurança e assim por diante.
Relacionamento entre tabelas
    Consiste em uma coleção de dados inter-relacionados e em um conjunto de programas para acessá-los
SGBDs são projetados para gerenciar grandes grupos de informações

-- SEQUEL - Structured English Query Language.
    Linguagem de banco de dados relacional

-- IDE - WorkBench
    Interface gráfica - Visualização de forma interativa o banco de dados

-- Entidades
    Dentro do banco de dados, temos diversas entidades. São estruturas que organizam o armazenamento do dado dentro do banco de dados. A entidade principal, entre outras, é a tabela. Ou seja, um banco de dados tem dentro dele uma coleção de tabelas.

-- Tabela
    Quando criamos uma tabela, temos que informar quantos campos temos e o tipo de cada campo.
    Cada linha da tabela chamamos de registro. O número de campos é limitado, mas o número de registro pode ser ilimitado.

-- Chave primária
    Ao criar a um campo e informamos que uma chave primária, não poderemos ter um informação repetida. ex. CPF igual no mesmo campo.

-- Chave estrangeira
    Relacionamento entre tabelas.
    Se eu crio uma chave estrangeira entre o campo CPF, que está na tabela que mostra as vendas e o campo CPF que está no cadastro de clientes, isso significa que há uma ligação entre essas duas tabelas. E aí não vou poder ter um CPF de cliente na tabela de vendas que não tenha sido previamente cadastrado na tabela de clientes.

-- Índice
    No contexto da estrutura de dados, é uma referência associada a uma chave, que é utilizada para fins de otimização, permitindo uma localização mais rápida de um registro quando efetuada uma consulta.

-- Esquemas
    O projeto geral do banco de dados.

-- DER
    Diagrama Entidade Relacionamento

-- View
    As views não são agrupadores de tabelas, e sim consultas que podem ou não conter várias tabelas.
    É um conjunto resultado de uma consulta armazenada sobre os dados, em que os usuários do banco de dados podem consultar simplesmente como eles fariam em um objeto de coleção de banco de dados persistente. Este comando de consulta pré-estabelecido é armazenado no dicionário de banco de dados.

-- Filtro
    A filtragem é uma maneira útil de ver apenas os dados que você deseja exibir nos bancos de dado

-- Procedures
    Fazemos programas para manipular dados do banco.
    Uma procedure é um bloco de comandos ou instruções SQL organizados para executar uma ou mais tarefas. Ela pode ser utilizada para ser acionada através de uma chamada simples que executa uma série de outros comandos.
    Funções

-- Trigger 
Alerta no banco de dados. 

-- rigistro = Tuplas

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

HAVING - 
HAVING é uma condição (filtro) que se aplica ao resultado de uma agregação

InnoDB 
    é um mecanismo de armazenamento para o MySQL. 
    O MySQL 5.5, e versões posteriores, o utilizam por padrão. Ele fornece as funcionalidades padrões de 
    transação complacentes com ACID, juntamente com o suporte a chave estrangeira (Integridade Referencial Declarativa).

ACID  
    atomicidade - toda tarefa é feita ou nada é conciderado
    consistente - antes de execurtar uma tarefa o banco estava ok, depois de executar essa tarefa ele terá que está ok
    isolamento - caso tenha uma tarefa sendo executado, caso execute outra tarefa, terá que ser feita isolada da outra. Sem interferência
    durabilidade - dado salvo não pode ser alterado. Nao pode perder dados do nada
