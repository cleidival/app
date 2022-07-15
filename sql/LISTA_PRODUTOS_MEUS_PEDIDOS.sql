use s9_real
go
select
distinct ps.codigo, ps.nome, '', nc.codigo, '',ps.Observacao, un.nome,ps.Peso_Bruto, '', '', 
(select top 1 concat(codigo,'-',nome) from classes where ordem=ps.Ordem_Classe) as classe,
(select top 1 concat(Codigo,'-',nome) from subclasses where ordem=ps.Ordem_Subclasse) as subclasse,
(select top 1 concat(codigo,'-',nome) from grupos where ordem=ps.Ordem_Grupo) as grupo,
'', '','', pp.Preco 
 from prod_serv ps inner join Prod_Serv_Precos pp on ps.ordem=pp.Ordem_Prod_Serv left join Tabelas_Preco tb on pp.Ordem_Tabela_Preco=tb.ordem left join Unidades_Venda un on 
 ps.Ordem_Unidade_Venda=un.ordem left join ncm nc on ps.Ordem_NCM=nc.ordem

where ps.Ordem_Pesquisa_3=(select top 1 ordem from Pesquisa_3 where codigo='1') and tb.nome='ATACADO'
group by ps.codigo, ps.nome, nc.codigo, ps.Observacao, un.nome, ps.Peso_Bruto, ps.ordem_classe, ps.ordem_subclasse, ps.ordem_grupo, pp.preco