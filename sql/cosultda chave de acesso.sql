select * from cidades
select cnpj from filiais
select modelo, numero, chave_acesso from movimento_documentos_fiscais where
 ordem_movimento=(select top 1 ordem from movimento where sequencia='384037' 
		and ordem_filial=(select top 1 ordem from filiais where codigo='1'))