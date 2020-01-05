select
'table name' = object_name(sc.id)
,   'column' = sc.name
,   'collation' = sc.collation
from
syscolumns sc
where
objectproperty([id], 'isusertable')=1
and collation is not null
--and   collation &lt;&gt; 'sql_latin1_general_cp1_ci_as'
order by
object_name(sc.id), sc.name asc
