DROP TABLE IF EXISTS tech_cluster_hh_enr_ttwa_for_r;
CREATE TABLE tech_cluster_hh_enr_ttwa_for_r
SELECT *	FROM	(select	t1.ttwa
									,t1.ttwa_code
									,sum(t1.firms) as entry_total
									,avg(t1.total_firms) as grand_total
									,avg(t1.hh) as hhi
                                    ,avg(t1.entry_rate) as entry_rate
									,avg(t1.average_latest_accounts_assets) as assets
									from `casa-dissertation`.df_hh_enr_for_r as t1
									group by t1.ttwa) as t2