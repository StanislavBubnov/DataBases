-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

USE shop;

SHOW TABLES;

SELECT * FROM products;

SELECT * FROM catalogs;

CREATE OR REPLACE
VIEW test_view (name_products, name_catalogs) AS (
SELECT
	products.name, catalogs.name
FROM
	products
LEFT JOIN catalogs
ON
	products.catalog_id = catalogs.id) ;

SELECT * FROM test_view;

