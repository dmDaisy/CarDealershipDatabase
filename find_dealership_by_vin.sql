-- Find dealership by VIN: 3FA6P0G73HR789123
SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN = '3FA6P0G73HR789123';
