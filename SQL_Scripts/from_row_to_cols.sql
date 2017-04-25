SELECT term2_id as dist0,
 
  coalesce ( (min(term1_id) FILTER (WHERE distance = 1)), 1) as dist1,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 2)), 1) as dist2,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 3)), 1) as dist3,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 4)), 1) as dist4,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 5)), 1) as dist5,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 6)), 1) as dist6,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 7)), 1) as dist7,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 8)), 1) as dist8,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 9)), 1) as dist9,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 10)), 1) as dist10,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 11)), 1) as dist11,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 12)), 1) as dist12,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 13)), 1) as dist13,
  coalesce ( (min(term1_id) FILTER (WHERE distance = 14)), 1) as dist14,

  coalesce ( (min(term1_id) FILTER (WHERE distance = 15)), 
             coalesce((min(term1_id) FILTER (WHERE distance = 15))), 
	   1 ) as dist15

FROM graph_path
WHERE distance IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
GROUP BY term2_id
ORDER BY term2_id;