-- Data used for test: 'Honda', 'Accord', 'Sedan', 'Blue'
SELECT DISTINCT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.color = 'Blue'
  AND v.make = 'Honda'
  AND v.model = 'Accord';
