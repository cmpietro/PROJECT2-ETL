-- DROP TABLE IF EXISTS Zip_codes;
-- DROP TABLE IF EXISTS SbxLocs;
-- DROP TABLE IF EXISTS WFlocs;
-- DROP TABLE IF EXISTS McDLocs;
-- DROP TABLE IF EXISTS IRS_data_2016;
-- DROP TABLE IF EXISTS IRS_2016_abridged;
-- DROP TABLE IF EXISTS All_companies_all_stores;




CREATE TABLE Zip_codes (
	zip VARCHAR(5),
	type VARCHAR(8),
	decommissioned INTEGER,
	primary_city VARCHAR(255),
	state VARCHAR(2),
	county VARCHAR(255),
	timezone VARCHAR(255),
	area_codes VARCHAR(255),
	world_region VARCHAR(2),
	country VARCHAR(2),
	latitude NUMERIC,
	longitude NUMERIC,
	irs_estimated_population_2015 INTEGER,
	PRIMARY KEY (zip)
);


CREATE TABLE SbxLocs (
	Brand VARCHAR(255),
	Store_Number VARCHAR(255),
	Store_Name VARCHAR(255),
	Ownership_Type VARCHAR(255),
	Street_Address VARCHAR(255),
	City_VARCHAR(255),
	State_Province VARCHAR(3),
	Country VARCHAR(2),
	Postcode VARCHAR(5),
	Phone_Number VARCHAR(255),
	Timezone VARCHAR(255),
	Longitude NUMERIC,
	Latitude NUMERIC,
	PRIMARY KEY (Store Number),
	FOREIGN KEY (Postcode) REFERENCES Zip_codes(zip)
);



CREATE TABLE WFlocs (
	store_number INTEGER,
	store_name VARCHAR(255),
	street_address VARCHAR(255),
	city VARCHAR(255),
	state VARCHAR(2),
	zip_code VARCHAR(5),
	lat NUMERIC,
	lon NUMERIC,
	PRIMARY KEY (store_number),
	FOREIGN KEY (zip_code REFERENCES Zip_codes(zip)
);


CREATE TABLE McDLocs (
	store_number INTEGER,
	store_name VARCHAR(255),
	street_address VARCHAR(255),
	city VARCHAR(255),
	state VARCHAR(2),
	zip_code VARCHAR(5),
	lat NUMERIC,
	long NUMERC,
	PRIMARY KEY (store_number),
	FOREIGN KEY (zip_code) REFERENCES Zip_codes(zip)
);

CREATE TABLE IRS_2016_abridged (
	zipcode VARCHAR(5),
	state VARCHAR(2),
	agi_sub INTEGER,
	N1 INTEGER,
	NUMDEP INTEGER,
	N02650 INTEGER,
	A02650 INTEGER,
	N00200 INTEGER,
	A00200 INTEGER,	
	N00900 INTEGER,
	A00900 INTEGER,
	N01000 INTEGER,
	A01000 INTEGER,
	N02300 INTEGER,
	A02300 INTEGER,
	N03210 INTEGER,
	A03210 INTEGER,
	PRIMARY KEY (zipcode, state, agi_sub)
);

CREATE TABLE All_comapnies_all_stores (
	zipcode VARCHAR(5),
	agi_sub INTEGER,
	number_sbx INTEGER,
	number_wf INTEGER,
	number_mcd INTEGER,
	N1 INTEGER,
	NUMDEP INTEGER,
	N02650 INTEGER,
	A02650 INTEGER,
	N00200 INTEGER,
	A00200 INTEGER,	
	N00900 INTEGER,
	A00900 INTEGER,
	N01000 INTEGER,
	A01000 INTEGER,
	N02300 INTEGER,
	A02300 INTEGER,
	N03210 INTEGER,
	A03210 INTEGER,
	PRIMARY KEY (zipcode),
	FOREIGN KEY (zipcode) REFERENCES Zip_codes(zip)
);



