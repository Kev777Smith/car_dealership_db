CREATE OR REPLACE PROCEDURE new_customer(first_name VARCHAR(50), last_name VARCHAR(50), address VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT into customer(first_name, last_name, address)
	VALUES (first_name, last_name, address);
END;
$$;

CALL new_customer('John', 'Smith', '123 Real St');

CALL new_customer('Lance', 'Armstrong', '555 Circle Dr')
 


CREATE OR REPLACE PROCEDURE new_vehicle("year" INTEGER, make VARCHAR(25), model VARCHAR(25), color VARCHAR(20), customer_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT into vehicle("year", make, model, color, customer_id)
	VALUES ("year", make, model, color, customer_id);
END;
$$;

CALL new_vehicle(2003, 'Chevrolet', 'Cavalier', 'Orange', 1);

CALL new_vehicle(2023, 'Tesla', 'Model S', 'White', 1);

CREATE OR REPLACE PROCEDURE new_inventory("year" INTEGER, make VARCHAR(25), model VARCHAR(25), color VARCHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO inventory("year", make, model, color)
	VALUES ("year", make, model, color);
END;
$$;

CALL new_inventory(2023, 'Toyota', 'Tacoma', 'Black');

CALL new_inventory(2023, 'Toyota', 'Corolla', 'Black');

INSERT INTO invoice(maintenance, total, customer_id, vehicle_id)
VALUES ('Oil Change', 39.99, 1, 2), ('Tire rotation', 89.69, NULL, NULL)


CREATE OR REPLACE PROCEDURE new_employee(first_name VARCHAR(50), last_name VARCHAR(50), address VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO employee(first_name, last_name, address)
	VALUES (first_name, last_name, address);
END;
$$;

CALL new_employee('Timmy', 'Longbottom', '69 Itsnotthatfunny Dr');
CALL new_employee('Willy', 'West', '111 Snake Rd');

INSERT INTO sales(employee_id, invoice_id, stock_number)
VALUES (1, 3, null), (1, NULL, 2)

INSERT INTO service(employee_id, invoice_id)
VALUES (2, 3), (2, 4)

SELECT *
FROM vehicle;