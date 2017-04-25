WITH RECURSIVE cte(path) AS ( --Recursively call on path (Works for every length)
	SELECT array[r.term1_id, r.term2_id] AS path
	FROM   temp_table r
	LEFT   JOIN temp_table r0 ON r0.term1_id = r.term2_id
	WHERE  r0.term2_id IS NULL
UNION ALL 
	SELECT r.term1_id || c.path
	FROM   cte c
	JOIN   temp_table r ON r.term2_id = c.path[1]
),
max_len AS (
    SELECT max(array_length(path, 1)) max_len
    FROM cte
    ),
arrai as 
(	SELECT fill_with_last_element(path, max_len) as col, array_length(path,1) as length
--fill_with_last_element(path, max_len) as col
	FROM cte
	CROSS JOIN max_len
	ORDER BY length
),
colum as(
	SELECT 
	col[2] as col1, 
	col[3] as col2, 
	col[4] as col3, 
	col[5] as col4, 
	col[6] as col5,
	col[7] as col6, 
	col[8] as col7, 
	col[9] as col8,
	col[10] as col9 
	--col[11] as col10, 
	--col[12] as col11, 
	--col[13] as col12, 
	--col[14] as col13,
	--col[15] as col14
	FROM arrai
	where col[1]=1
)
INSERT INTO temp_hierarchy_split(col1, col2, col3, col4, col5, col6, col7, col8, col9)
SELECT col1, col2, col3, col4, col5, col6, col7, col8, col9
FROM colum;