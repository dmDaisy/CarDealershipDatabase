-- ---------------------------------------------------------------------- --
-- Target DBMS:           MySQL                                           --
-- Project name:          CarDealershipDatabase                       --
-- ---------------------------------------------------------------------- --

DROP DATABASE IF EXISTS car_dealership;

CREATE DATABASE IF NOT EXISTS car_dealership;

USE car_dealership;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "dealerships"                                                 #
# ---------------------------------------------------------------------- #

DROP TABLE IF EXISTS dealerships;
CREATE TABLE IF NOT EXISTS dealerships (
    dealership_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12),
    PRIMARY KEY (dealership_id)
);

-- ---------------------------------------------------------------------- --
-- Add table: vehicles                                                        --
-- ---------------------------------------------------------------------- --
DROP TABLE IF EXISTS vehicles;
CREATE TABLE IF NOT EXISTS vehicles (
    VIN VARCHAR(17) NOT NULL,
    year INT,
    make VARCHAR(50),
    model VARCHAR(50),
    type VARCHAR(20),
    color VARCHAR(20),
    mileage INT,
    price DECIMAL(10, 2),
    SOLD BOOLEAN,
    PRIMARY KEY (VIN)
);

-- ---------------------------------------------------------------------- --
-- Add table: inventory (track which dealership has the vehicle)                            --
-- ---------------------------------------------------------------------- --
DROP TABLE IF EXISTS inventory;
CREATE TABLE IF NOT EXISTS inventory (
    dealership_id INT NOT NULL,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- ---------------------------------------------------------------------- --
-- Add table: sales_contracts                                                 --
-- ---------------------------------------------------------------------- --
DROP TABLE IF EXISTS sales_contracts;
CREATE TABLE IF NOT EXISTS sales_contracts (
    id INT NOT NULL AUTO_INCREMENT,
    contract_date DATE,
    customer_name VARCHAR(50),
    customer_email VARCHAR(100),
    VIN VARCHAR(17),
    total_price DECIMAL(10, 2),
    monthly_payment DECIMAL(10, 2),
    sales_tax_amount DECIMAL(10, 2),
    recording_fee DECIMAL(10, 2),
    processing_fee DECIMAL(10, 2),
    financed BOOLEAN,
    PRIMARY KEY (id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- ---------------------------------------------------------------------- --
-- Add table: lease_contracts                                      --
-- ---------------------------------------------------------------------- --
DROP TABLE IF EXISTS lease_contracts;
CREATE TABLE IF NOT EXISTS lease_contracts (
    id INT NOT NULL AUTO_INCREMENT,
    contract_date DATE,
    customer_name VARCHAR(50),
    customer_email VARCHAR(100),
    VIN VARCHAR(17),
    total_price DECIMAL(10, 2),
    monthly_payment DECIMAL(10, 2),
    expected_ending_value DECIMAL(10, 2),
    lease_fee DECIMAL(10, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add info into "dealerships"                                             #
# ---------------------------------------------------------------------- #

INSERT INTO dealerships (name, address, phone) VALUES
('dealer 1', '100 College Rd', '000-000-0000'),
('dealer 2', '200 College Rd', '000-000-0001'),
('dealer 3', '300 College Rd', '000-000-0002');

# ---------------------------------------------------------------------- #
# Add info into "vehicles"                                             #
# ---------------------------------------------------------------------- #

INSERT INTO vehicles (VIN, year, make, model, type, color, mileage, price, SOLD) VALUES
('1HGCM82633A123456', 2020, 'Honda', 'Accord', 'Sedan', 'Blue', 15000, 20000.00, FALSE),
('2T1BURHE0JC654321', 2021, 'Toyota', 'Camry', 'Sedan', 'White', 10000, 22000.00, TRUE),
('3FA6P0G73HR789123', 2019, 'Ford', 'Fusion', 'Sedan', 'Black', 18000, 18000.00, TRUE),
('1C4RJFAG0FC543210', 2022, 'Jeep', 'Grand Cherokee', 'SUV', 'Red', 5000, 35000.00, FALSE),
('5NPE24AF8FH112233', 2021, 'Hyundai', 'Sonata', 'Sedan', 'Silver', 8000, 21000.00, FALSE);

# ---------------------------------------------------------------------- #
# Add info into "inventory"                                             #
# ---------------------------------------------------------------------- #

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(1, '2T1BURHE0JC654321'),
(1, '3FA6P0G73HR789123'),
(2, '1C4RJFAG0FC543210'),
(3, '5NPE24AF8FH112233');

# ---------------------------------------------------------------------- #
# Add info into "sales_contracts"                                             #
# ---------------------------------------------------------------------- #

INSERT INTO sales_contracts (
    contract_date, customer_name, customer_email, VIN,
    total_price, monthly_payment, sales_tax_amount,
    recording_fee, processing_fee, financed
) VALUES
('2024-06-01', 'John Smith', 'john.smith@email.com', '2T1BURHE0JC654321',
 23000.00, 400.00, 1800.00, 100.00, 295.00, TRUE),
('2024-05-15', 'Alice Chen', 'alice.chen@email.com', '3FA6P0G73HR789123',
 19000.00, 0.00, 1520.00, 100.00, 295.00, FALSE);

# ---------------------------------------------------------------------- #
# Add info into "lease_contracts"                                             #
# ---------------------------------------------------------------------- #

INSERT INTO lease_contracts (
    contract_date, customer_name, customer_email, VIN,
    total_price, monthly_payment, expected_ending_value, lease_fee
) VALUES
('2025-01-10', 'Derek White', 'derek.white@email.com', '1C4RJFAG0FC543210',
 34000.00, 450.00, 15000.00, 495.00);
