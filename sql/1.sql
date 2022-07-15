	select * from financeiro_caixa f inner join financeiro_contas c on f.ordem_financeiro_contas=c.ordem
	 where f.ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
	and f.data between '2017-10-03 00:00:00' and '2017-10-04 23:59:59' --and c.pagar_receber='P'
	
		select * from financeiro_caixa f
	 where f.ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
	and f.data between '2017-10-03 00:00:00' and '2017-10-04 23:59:59' --and c.pagar_receber='P'