select top 1 *, status =
(CASE 
      WHEN xml_cancelamento<>''  THEN 'C'
      WHEN xml_cancelamento='' THEN '0' 
   END) 
from Movimento_Documentos_Fiscais where xml_cancelamento<>''
