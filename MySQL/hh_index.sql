DROP TABLE IF EXISTS tech_cluster_hh;
CREATE TABLE tech_cluster_hh
SELECT t2.ttwa, t2.birth_year, sum(t2.sub_hh) as hh
FROM (SELECT t0.ttwa, 
							t0.birth_year,
                            t0.primary_uk_sic_2007, 
                            power(count(t0.registered_number)/t1.year_total,2) as sub_hh
							FROM 	`casa-dissertation`.tech_cluster_ttwa_in_England_year_98218_sic as t0,
											(SELECT ttwa, 
															birth_year,  
															count(registered_number) as year_total 
															FROM `casa-dissertation`.tech_cluster_ttwa_in_England_year_98218_sic
															GROUP BY ttwa, birth_year) as t1
							WHERE t0.ttwa = t1.ttwa and t0.birth_year = t1.birth_year
							GROUP BY t0.ttwa, t0.birth_year, t0.primary_uk_sic_2007 ) as t2
GROUP BY t2.ttwa, t2.birth_year