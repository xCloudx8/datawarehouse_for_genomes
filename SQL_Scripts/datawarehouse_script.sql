DROP TABLES IF EXISTS ft_variants, dt_positions, dt_term, dt_refalt ;

CREATE TABLE ft_variants( --Fact table

  phenotype VARCHAR(300) REFERENCES dt_term(all),
  ref VARCHAR(300) REFERENCES dt_refalt(ref),
  pos_chr VARCHAR(300) REFERENCES dt_positions(pos_chr),

  tot_var INTEGER(300),

);

CREATE TABLE dt_refalt( -- Dimension table

  ref VARCHAR(300) PRIMARY KEY,
  refalt VARCHAR(300)

);

CREATE TABLE dt_positions(

  pos_chr VARCHAR(300) PRIMARY KEY,
  pos_int INT(30)

);

CREATE TABLE dt_term(

  all VARCHAR(300) PRIMARY KEY,
  system VARCHAR(500),
  sub_system VARCHAR(300) ,
  general_definition VARCHAR(300),
  sub_category VARCHAR(300) ,
  area_target VARCHAR(500),
  focus_target VARCHAR(300) ,
  Process_abnormalities_focus_target VARCHAR(500),
  phenotype VARCHAR(300)

);
