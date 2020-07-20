CREATE TEMPORARY TABLE storehouses_products (id INT PRIMARY KEY AUTO_INCREMENT, value INT)

INSERT INTO storehouses_products (value) VALUES
	(1),
	(200),
	(2500),
	(0),
	(3);

SELECT * FROM storehouses_products;

SELECT * FROM storehouses_products ORDER BY CASE 
	WHEN value = 1 THEN 0  
	WHEN value = 3 THEN 1
	WHEN value = 200 THEN 2
	WHEN value = 2500 THEN 3
	WHEN value = 0 THEN 4 
	end;