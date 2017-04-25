select t1.col2, t1.col3, t1.col4, t1.col5,t1.col6,t1.col7,t1.col8,t1.col9,t1.col10,t1.col11,t1.col12,t1.col13,t1.col14,t1.col15,
 t2.name2, t2.name3, t2.name4 , t2.name5, t2.name6, t2.name7, t2.name8, t2.name9, t2.name10, t2.name11, t2.name12, t2.name13, t2.name14, t2.name15
from (select t1.*, row_number() over () as seqnum
      from temp_hierarchy_split t1
     ) t1 join
     (select t2.*, row_number() over () as seqnum
      from temp_hierachy_name t2
     ) t2
     on t1.seqnum = t2.seqnum
limit 4;
