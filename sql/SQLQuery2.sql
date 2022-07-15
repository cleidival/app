select mf.ordem, mv.sequencia, mv.Tipo_Operacao, mf.Modelo, mf.data_emissao, mf.Numero, mf.chave_acesso, mf.numero_recibo, mf.Protocolo_Autorizacao,
 mv.Preco_Final_Somado from movimento_documentos_fiscais mf inner join 
 movimento mv on mf.ordem_movimento=mv.ordem left join filiais fl on mv.ordem_filial=fl.ordem where 
-- mf.Protocolo_Autorizacao='' 
MV.SEQUENCIA=391315 and  (mv.Tipo_Operacao='vnd' or mv.Tipo_Operacao='vef') 
and (mf.data_emissao between CONVERT(datetime,'2017-10-09 00:00:00',121) and CONVERT(datetime,'2017-10-09 23:59:59', 121))
and fl.codigo='1' order by mf.data_emissao desc