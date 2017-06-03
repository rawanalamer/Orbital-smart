--all locations of QR codes
CREATE TABLE locations (
	locationId SERIAL PRIMARY KEY,
	diagram VARCHAR(128)
);

CREATE TABLE carparks(
       carparkId VARCHAR(64) PRIMARY KEY,
		zone VARCHAR(64) NOT NULL,
       diagram VARCHAR(128)
);

--Information for all stores in the directory
--diagram shows the store's location
CREATE TABLE stores(
	storeId SERIAL PRIMARY KEY,
	name VARCHAR(64) UNIQUE NOT NULL,
	unit VARCHAR(8) UNIQUE NOT NULL,
	opening VARCHAR(32),
	website VARCHAR(64) UNIQUE NOT NULL,
	number VARCHAR(8) UNIQUE NOT NULL,
	description VARCHAR(1000) UNIQUE NOT NULL,
	diagram VARCHAR(128)
);

--directions to a store from a current location
--directions is the written directions (turn left after topshop)
CREATE TABLE directions(
	locationId VARCHAR(64) REFERENCES locations(locationId) ON DELETE CASCADE,
	storeId VARCHAR(64) REFERENCES stores(storeId) ON DELETE CASCADE,
	directions VARCHAR(1000),
	diagram VARCHAR(128)
);

CREATE TABLE carpark_directions(
	carparkId VARCHAR(64) REFERENCES carparks(carparkId) ON DELETE CASCADE,
	storeId VARCHAR(64) REFERENCES stores(storeId) ON DELETE CASCADE,
	directions VARCHAR(1000),
	diagram VARCHAR(128)
);


