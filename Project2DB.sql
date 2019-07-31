--PROJECT2_ETL

--CENSUS DATA, Abridged

--DROP table census

CREATE TABLE census(
	user_id serial PRIMARY KEY,
	zipcode VARCHAR (9),
	state VARCHAR (2),
	agiSub VARCHAR (20),
	n1 INT,
	numdep INT,
	N02650 INT,
	A02650 INT,
	N00200 INT,
	A00200 INT,
	N00900 INT,
	A00900 INT,
	N01000 INT,
	A01000 INT,
	N02300 INT,
	A02300 INT,
	N03210 INT,
	A03210 INT
	);
	
SELECT *
from census;

--STARBUCKS DATA

--DROP table starbucks;

CREATE TABLE starbucks(
	star_id serial PRIMARY KEY,
	brand VARCHAR (20),
	store_number VARCHAR (15),
	store_name	VARCHAR (20),
	ownership_type VARCHAR (20),
	street_address  VARCHAR (50),
	city VARCHAR (25),
	state_province VARCHAR (5),
	country VARCHAR (25),
	postcode VARCHAR (9),
	phone_number VARCHAR (10),
	timezone VARCHAR (20),
	longitude VARCHAR (5),
	latitude VARCHAR (5),
	postcode2 VARCHAR (9)
		
	);
	
SELECT *
FROM starbucks;

___________________

--ZIP CODES DATA
--DROP table zipcodes;

CREATE TABLE zipcodes(
	zip_id serial PRIMARY KEY,
	zip VARCHAR (9),
	type VARCHAR (10),
	decommissioned VARCHAR (3),
	primary_city VARCHAR (25),
	state VARCHAR (2),
	county VARCHAR (20),
	timezone VARCHAR (20),
	area_codes VARCHAR (20),
	world_region VARCHAR (5),
	country VARCHAR (5),
	latitude VARCHAR (5),
	longitude VARCHAR (5),
	irs_estimated_population_2015 INT
	);

Select *
FROM zipcodes;

____________
--WHOLEFOODS DATA

