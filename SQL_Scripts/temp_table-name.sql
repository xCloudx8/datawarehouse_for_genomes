SELECT 
T2_2.nome as col2,
T2_3.nome as col3, 
T2_4.nome as col4,
T2_5.nome as col5,
T2_6.nome as col6,
T2_7.nome as col7,
T2_8.nome as col8,
T2_9.nome as col9,
T2_10.nome as col10,
T2_11.nome as col11,
T2_12.nome as col12,
T2_13.nome as col13,
T2_14.nome as col14,
T2_15.nome as col15

FROM temp_hierarchy_split

LEFT JOIN term as T2_2 on T2_2.id=temp_hierarchy_split.col2
LEFT JOIN term as T2_3 on T2_3.id=temp_hierarchy_split.col3
LEFT JOIN term as T2_4 on T2_4.id=temp_hierarchy_split.col4
LEFT JOIN term as T2_5 on T2_5.id=temp_hierarchy_split.col5
LEFT JOIN term as T2_6 on T2_6.id=temp_hierarchy_split.col6
LEFT JOIN term as T2_7 on T2_7.id=temp_hierarchy_split.col7
LEFT JOIN term as T2_8 on T2_8.id=temp_hierarchy_split.col8
LEFT JOIN term as T2_9 on T2_9.id=temp_hierarchy_split.col9
LEFT JOIN term as T2_10 on T2_10.id=temp_hierarchy_split.col10
LEFT JOIN term as T2_11 on T2_11.id=temp_hierarchy_split.col11
LEFT JOIN term as T2_12 on T2_12.id=temp_hierarchy_split.col12
LEFT JOIN term as T2_13 on T2_13.id=temp_hierarchy_split.col13
LEFT JOIN term as T2_14 on T2_14.id=temp_hierarchy_split.col14
LEFT JOIN term as T2_15 on T2_15.id=temp_hierarchy_split.col15
