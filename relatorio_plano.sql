use s9_real
go
-------------------------------------------------
--versao1.1
select 
cb.codigo, cb.Nome,
(select top 1 concat(codigo,'-',nome) from Funcionarios where ordem=fc.Ordem_Funcionario_Alteracao) as funcionario, cf.codigo, cf.nome as fornecedor, fc.Descricao,
format(fc.Data_Vencimento_Original,'dd/MM/yyyy') as data_vencimento_original,
format(fc.Data_Quitacao, 'dd/MM/yyyy') as data_quitacao, fc.Valor_Base, fc.Valor_Juros, fc.Valor_Multa, fc.Valor_Desconto, fc.Valor_Quitado, p3.codigo, p3.nome, cc.Codigo,cc.Nome
from 
Financeiro_Contas fc
inner join  Plano_Contas3 p3 on fc.Ordem_Plano_Contas3 = p3.Ordem 
left join Cli_For cf on fc.Ordem_Cli_For = cf.Ordem
left join centro_custo cc on fc.Ordem_Centro_Custo=cc.Ordem
left join Financeiro_Contas fc1 on fc.Ordem_Financeiro_Relacao = fc1.Ordem
left join Financeiro_Contas_Bancarias_Lancamentos fcbl on fc1.Ordem_Lancamento_Bancario = fcbl.Ordem 
left join Contas_Bancarias cb on fcbl.Ordem_Conta_Bancaria = cb.Ordem
where fc.Pagar_Receber='P'
and fc.Situacao = 'Q'
and fc.Tipo_Conta = 'R'
and fc.Ordem_Lancamento_Bancario=''
--------------------------------------------------------------------------------------------
/*
Somente alterar codigo da conta bancaria e periodo data_quitacao
*/
--and cb.Codigo=4
and fc.Data_Quitacao between '2017-07-01 00:00:00' and '2017-10-14 23:59:59'
--------------------------------------------------------------------------------------------
ORDER BY Data_Quitacao