create function get_data()
  returns table (path text)
as
$$
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
    )
SELECT array_to_string(fill_with_last_element(path, max_len), ',' , '*')
FROM cte
CROSS JOIN max_len
ORDER BY path;
$$
language sql;