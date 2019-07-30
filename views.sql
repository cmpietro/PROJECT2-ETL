-- DROP VIEW sbx_zip;

CREATE VIEW sbx_zip AS
SELECT z.zip, COUNT(sbx.store_number) AS num_sbx
FROM  zip_codes AS z
LEFT JOIN sbxlocs AS sbx ON
z.zip = sbx.postcode2
GROUP BY z.zip
ORDER BY num_sbx DESC;


-- DROP VIEW sbx_zip;

CREATE VIEW irsaggs AS
SELECT z.zip, SUM(i.N1) AS rets, SUM(i.NUMDEP) AS dep, SUM(i.N02650) AS ret_tot_inc, 
 SUM(i.A02650) AS tot_inc, SUM(i.N00200) AS ret_wages, SUM(i.A00200) AS wages, 
 SUM(i.N00900) AS rets_bus_inc, SUM(i.A00900) AS bus_inc, SUM(i.N01000) AS ret_cap_gain,
 SUM(i.A01000) AS cap_gain, SUM(i.N02300) AS rets_unemp, SUM(i.A02300) AS unemp,
 SUM(i.N03210) AS rets_stu_loan_deduct, SUM(i.A03210) AS stu_loan_deduct
FROM zip_codes as z
LEFT JOIN irs_2016_abridged AS i ON
z.zip = i.zipcode
GROUP BY z.zip
ORDER BY z.zip;