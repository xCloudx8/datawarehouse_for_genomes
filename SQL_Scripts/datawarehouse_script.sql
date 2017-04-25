DROP TABLES IF EXISTS varianti, snp, term, term_definition;

CREATE TABLE varianti(

frequenze VARCHAR(300),
chr VARCHAR(300),
ref VARCHAR(300),
alt VARCHAR(300),
snp_ip INT(30),
id INT(30)

);

CREATE TABLE snp(

snp_ip VARCHAR(300) REFERENCES varianti(snp_id)

);

CREATE TABLE term(

nome VARCHAR(300),
id INT(30) REFERENCES varianti(id)

);

CREATE TABLE term_definition(

term_id VARCHAR(300) REFERENCES term(id),
term_definition VARCHAR(500)

);
