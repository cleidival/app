SELECT
    OBJECT_NAME(object_id,database_id) As Tabela, Index_Id,
    last_user_seek, last_user_scan, last_user_lookup, last_user_update
FROM sys.dm_db_index_usage_stats
WHERE database_id = DB_ID() And OBJECTPROPERTYEX(object_id,'IsUserTable') = 1
ORDER BY Index_ID desc