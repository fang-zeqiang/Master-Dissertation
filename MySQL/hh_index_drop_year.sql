DROP TABLE IF EXISTS tech_cluster_hh_ttwa_only;
CREATE TABLE tech_cluster_hh_ttwa_only
SELECT t2.ttwa, sum(t2.sub_hh_2) as hh
FROM (SELECT t0.ttwa, 
                            t0.primary_uk_sic_2007, 
                            power(count(t0.registered_number)/t1.ttwa_total,2) as sub_hh_2
							FROM 	`casa-dissertation`.tech_cluster_ttwa_in_England_year_98218_sic as t0,
											(SELECT ttwa, 
															count(registered_number) as ttwa_total 
															FROM `casa-dissertation`.tech_cluster_ttwa_in_England_year_98218_sic
															WHERE diss_year = 0  -- diss year's firms should be excluded
                                                            GROUP BY ttwa) as t1
							WHERE t0.ttwa = t1.ttwa and t0.diss_year = 0 -- diss year's firms should be excluded
							GROUP BY t0.ttwa, t0.primary_uk_sic_2007 ) as t2
GROUP BY t2.ttwa