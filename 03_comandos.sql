describe dados_vendedor;
show databases;
show tables;
select * from carro;
select * from dados_vendedor;
desc dados_vendedor;
use sucos_vendas;

select embalagem, tamanho from tabela_de_produtos;
select distinct embalagem, tamanho from tabela_de_produtos;
select distinct embalagem, tamanho from tabela_de_produtos where sabor = 'laranja';
select distinct embalagem, tamanho, sabor from tabela_de_produtos;
select * from tabela_de_produtos limit 5;
select * from tabela_de_produtos limit 5,5;
select * from tabela_de_produtos order by nome_do_produto;
select * from tabela_de_produtos order by nome_do_produto desc;
select * from tabela_de_produtos order by nome_do_produto asc;
select * from tabela_de_produtos order by codigo_do_produto asc, nome_do_produto desc;
select estado, sum(limite_de_credito) as Limite_Total from tabela_de_clientes group by estado;
select embalagem, max(preco_de_lista) as maior_preco from tabela_de_produtos group by embalagem;
select embalagem, count(*) as quantidade from tabela_de_produtos group by embalagem;
select bairro, sum(limite_de_credito) as limite from tabela_de_clientes where cidade = 'Rio de Janeiro' group by bairro;
select bairro, estado, sum(limite_de_credito) as limite from tabela_de_clientes where cidade = 'Rio de Janeiro' group by bairro, estado;
select bairro, estado, sum(limite_de_credito) as limite from tabela_de_clientes where cidade = 'Rio de Janeiro' group by bairro, estado order by bairro;
SELECT ESTADO, SUM(limite_de_credito) AS SOMA_LIMITE FROM tabela_de_clientes WHERE limite_de_credito < 900000 GROUP BY ESTADO;
SELECT ESTADO, SUM(limite_de_credito) AS SOMA_LIMITE FROM tabela_de_clientes GROUP BY ESTADO having sum(limite_de_credito) = 995000;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos GROUP BY EMBALAGEM;
select embalagem, max(preco_de_lista) as maior_preço, min(preco_de_lista) as menor_preço from tabela_de_produtos group by embalagem having sum(preco_de_lista)<= 80 and max(preco_de_lista) >= 5;
select nome_do_produto, preco_de_lista, case when preco_de_lista >= 12 then 'Produto Caro' when preco_de_lista >= 7 and preco_de_lista < 12 then 'Produto em Conta' else 'Produto Barato' end as status_preco from tabela_de_produtos;
select embalagem, case when preco_de_lista >= 12 then 'Produto Caro' when preco_de_lista >= 7 and preco_de_lista < 12 then 'Produto em Conta' else 'Produto Barato' end as status_preco,avg(preco_de_lista) as preco_medio from tabela_de_produtos where sabor = 'Manga' group by embalagem, case when (preco_de_lista) >=12 then 'Produto Caro' when (preco_de_lista) >=7 and (preco_de_lista) <12 then 'Produto em Conta' else 'Produto Barato' end order by embalagem;


