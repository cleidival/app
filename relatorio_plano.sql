use s9_real
go
-------------------------------------------------
--versao1.0
select 
cb.codigo, cb.Nome,
(select top 1 concat(codigo,'-',nome) from Funcionarios where ordem=fc.Ordem_Funcionario_Alteracao) as funcionario,
--fc.Ordem_Funcionario_Alteracao, fc.Ordem_Funcionario_Criacao, fc.Ordem_Funcionario_Recebimento
cf.codigo,cf.nome as fornecedor, fc.Descricao, format(fc.Data_Vencimento_Original,'dd/MM/yyyy') as data_vencimento_original,
format(fc.Data_Quitacao, 'dd/MM/yyyy')as data_quitacao, fc.Valor_Base,
fc.Valor_Juros, fc.Valor_Multa, fc.Valor_Desconto, fc.Valor_Quitado, p3.codigo, p3.nome, cc.Codigo,cc.Nome
from 
Financeiro_Contas fc inner join Financeiro_Contas_Bancarias_Lancamentos lb on fc.Ordem_Lancamento_Bancario=lb.Ordem 
left join Contas_Bancarias cb on lb.Ordem_Conta_Bancaria=cb.Ordem left join Plano_Contas3 p3 on fc.Ordem_Plano_Contas3=p3.Ordem
left join Cli_For cf on fc.Ordem_Cli_For=cf.Ordem left join centro_custo cc on fc.Ordem_Centro_Custo=cc.Ordem
where 
fc.pagar_receber='P'
and fc.Situacao = 'Q'
and fc.Tipo_Conta<>''
and fc.Ordem_Lancamento_Bancario<>0
--------------------------------------------------------------------------------------------
/*
Somente alterar codigo da conta bancaris e periodo data_quitacao
*/
--and cb.Codigo=4
and fc.Data_Quitacao between '2017-09-01 00:00:00' and '2017-09-30 23:59:59'
--------------------------------------------------------------------------------------------
