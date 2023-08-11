CREATE TABLE vehicle(
	vehicle_id SERIAL PRIMARY KEY,
	"year" INTEGER NOT NULL,
	make VARCHAR(25) NOT NULL,
	model VARCHAR(25) NOT NULL,
	color VARCHAR(20)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	address VARCHAR(100) NOT NULL
);


ALTER TABLE vehicle
ADD COLUMN customer_id INTEGER;

ALTER TABLE vehicle 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	maintenance VARCHAR(1000),
	total NUMERIC(8,2) NOT NULL 
);

ALTER TABLE invoice
ADD COLUMN customer_id INTEGER;

ALTER TABLE invoice 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

ALTER TABLE invoice
ADD COLUMN vehicle_id INTEGER;

ALTER TABLE vehicle 
ADD FOREIGN KEY(vehicle_id) REFERENCES vehicle(vehicle_id);


CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT null,
	last_name VARCHAR(50) NOT null,
	address VARCHAR(100) NOT null,
	customer_id INTEGER,
	invoice_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);


CREATE TABLE inventory(
	stock_number SERIAL PRIMARY KEY,
	"year" INTEGER NOT NULL,
	make VARCHAR(25) NOT NULL,
	model VARCHAR(25) NOT NULL,
	color VARCHAR(20),
	invoice_id INTEGER,
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

CREATE TABLE service(
	employee_id INTEGER,
	invoice_id INTEGER,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

CREATE TABLE sales(
	employee_id INTEGER,
	invoice_id INTEGER,
	stock_number INTEGER,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
	FOREIGN KEY (stock_number) REFERENCES inventory(stock_number)
);