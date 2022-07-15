select 
distinct pc1.codigo, pc1.nome, pc2.codigo, pc2.nome, pc3.codigo, pc3.nome,
sum(fc.Valor_Quitado) as valor_quitado
from Financeiro_Contas fc inner join Plano_Contas3 pc3 on fc.Ordem_Plano_Contas3=pc3.Ordem left join Plano_Contas2 pc2 on pc3.Ordem_Plano_Contas2=pc2.Ordem left join Plano_Contas1 pc1 on
pc2.Ordem_Plano_Contas1=pc1.Ordem
where
fc.data_quitacao between '12/10/2017 00:00:00' and '12/10/2017 23:59:59' and fc.Ordem_Filial=(select top 1 ordem from filiais where codigo='1') and fc.Tipo_Conta='A' and fc.ordem_renegociado_agrupado is null
group by pc1.codigo, pc1.nome, pc2.codigo, pc2.nome, pc3.codigo, pc3.nome
order by pc1.codigo, pc2.codigo, pc3.codigo


select top 100 * from Financeiro_Contas where Tipo_Recebido_Pago='B'
 order by ordem desc