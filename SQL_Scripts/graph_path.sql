SELECT *
  FROM public.graph_path
  WHERE distance=1;

SELECT term1_id, term2_id
FROM graph_path
Where distance=1 and term1_id=5
ORDER BY term1_id;

SELECT term1_id, term2_id
FROM term2term
WHERE term1_id=5;

SELECT a.term1_id, a.term2_id 
FROM graph_path as a, term2term as b
WHERE NOT EXISTS
(
   SELECT a.term1_id, a.term2_id 
   FROM graph_path as a, term2term as b
   WHERE b.term1_id = a.term1_id and b.term2_id = a.term2_id
)