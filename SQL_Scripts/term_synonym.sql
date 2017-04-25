SELECT term_synonym.term_id, term.id, term.nome, term_synonym.term_synonym, graph_path.distance
  FROM term_synonym, term, graph_path
  where term_synonym.term_id =  term.id
  limit 10;
