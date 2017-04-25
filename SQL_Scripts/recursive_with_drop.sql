SELECT format('DROP FUNCTION %s(%s);'
            , oid::regproc
            , pg_get_function_identity_arguments(oid))
FROM   pg_proc
WHERE  proname = 'fil_with_last_element'  -- name without schema-qualification
AND    pg_function_is_visible(oid);

CREATE OR REPLACE FUNCTION fill_with_last_element(arr anyarray, n INTEGER)
RETURNS anyarray LANGUAGE plpgsql as $$
DECLARE
    l int = array_length(arr,1);
BEGIN
    RETURN 
	CASE 
		WHEN l > n 
			THEN arr 
		ELSE arr || array_fill(arr[l], array[n- l])
    END;
END $$; --Create function filling empty spaces with last non null value

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
 