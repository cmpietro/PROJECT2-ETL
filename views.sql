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

-- DROP VIEW wf_clean;

CREATE VIEW wf_clean AS
SELECT DISTINCT * FROM wflocs;

-- DROP VIEW aggregated_data

CREATE VIEW aggregated_data AS
SELECT z.zip, z.state, count(mcd.store_number) AS num_McD, s.num_sbx, count(wf.wf_address) AS num_wf, i.rets, i.dep, i.ret_tot_inc, 
 i.tot_inc, i.ret_wages, i.wages, i.rets_bus_inc, i.bus_inc, i.ret_cap_gain, i.cap_gain, 
 i.rets_unemp, i.unemp, i.rets_stu_loan_deduct, i.stu_loan_deduct
FROM zip_codes as z
LEFT JOIN irsaggs AS i ON
z.zip = i.zip
LEFT JOIN sbx_zip AS s ON
z.zip = s.zip
LEFT JOIN wf_clean AS wf ON
z.zip = wf.wf_zip
LEFT JOIN mcdlocs AS mcd ON
z.zip = mcd.zip_code
GROUP BY z.zip, s.num_sbx, i.rets, i.dep, i.ret_tot_inc, 
 i.tot_inc, i.ret_wages, i.wages, i.rets_bus_inc, i.bus_inc, i.ret_cap_gain, i.cap_gain, 
 i.rets_unemp, i.unemp, i.rets_stu_loan_deduct, i.stu_loan_deduct;

