select sum(dinheiro) as dinheiro, sum(vale) as vale, sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito,
 sum(cartao_credito) as cartao_credito, sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto, sum(parcelamento_carne) as carne, 
 sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente from financeiro_caixa
 where ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
and data between '2017-10-03 00:00:00' and '2017-10-03 23:59:59' and tipo_movimento='ABR'

	select sum(dinheiro) as dinheiro, sum(vale) as vale, sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito,
	 sum(cartao_credito) as cartao_credito, sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto, sum(parcelamento_carne) as carne, 
	 sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente from financeiro_caixa
	 where ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
	and data between '2017-10-03 00:00:00' and '2017-10-03 23:59:59' and tipo_movimento='VND'

select sum(dinheiro) as dinheiro, sum(vale) as vale, sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito,
 sum(cartao_credito) as cartao_credito, sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto, sum(parcelamento_carne) as carne, 
 sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente from financeiro_caixa
 where ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
and data between '2017-10-03 00:00:00' and '2017-10-03 23:59:59' and tipo_movimento='REC'

select sum(dinheiro) as dinheiro, sum(vale) as vale, sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito,
 sum(cartao_credito) as cartao_credito, sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto, sum(parcelamento_carne) as carne, 
 sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente from financeiro_caixa
 where ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
and data between '2017-10-03 00:00:00' and '2017-10-03 23:59:59' and tipo_movimento='MM' 
and (dinheiro<0 or vale<0 or cheque_a_vista<0 or cheque_pre<0 or cartao_debito<0 or cartao_convenio<0 or parcelamento_boleto<0 or parcelamento_carne<0 or parcelamento_carteira<0 or credito_cliente<0)

select sum(dinheiro) as dinheiro, sum(vale) as vale, sum(cheque_a_vista) as cheque, sum(cheque_pre) as cheque_pre, sum(cartao_debito) as cartao_debito,
 sum(cartao_credito) as cartao_credito, sum(cartao_convenio) as convenio, sum(parcelamento_boleto) as boleto, sum(parcelamento_carne) as carne, 
 sum(parcelamento_carteira) as carteira, sum(credito_cliente) as credito_cliente from financeiro_caixa
 where ordem_caixa=(select ordem from caixas where codigo='1' and ordem_filial=(select ordem from filiais where codigo='1')) 
and data between '2017-10-03 00:00:00' and '2017-10-03 23:59:59' and tipo_movimento='MM' 
and (dinheiro>0 or vale>0 or cheque_a_vista>0 or cheque_pre>0 or cartao_debito>0 or cartao_convenio>0 or parcelamento_boleto>0 or parcelamento_carne>0 or parcelamento_carteira>0 or credito_cliente>0)