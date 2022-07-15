use s9_real
go
select top 1 * from movimento_documentos_fiscais where ordem_movimento in (select ordem from movimento where sequencia=391315)
