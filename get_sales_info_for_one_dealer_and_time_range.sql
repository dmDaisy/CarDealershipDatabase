-- Find all sales contracts make by dealer 1 during 2024-05-30 and 2024-06-30
SELECT sc.*
FROM sales_contracts sc
JOIN inventory i ON sc.VIN = i.VIN
WHERE i.dealership_id = 1
  AND sc.contract_date BETWEEN '2024-05-30' AND '2024-06-30';
