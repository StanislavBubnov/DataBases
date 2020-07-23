-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

USE shop;

SELECT 
	p.id, p.name, p.price,
	c.id AS cat_id,
	c.name AS catalog
FROM
	products AS p
JOIN
	catalogs AS c
ON 
	p.catalog_id = c.id;
	
