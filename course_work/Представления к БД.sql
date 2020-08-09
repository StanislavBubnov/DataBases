USE fns;

-- 1. Сделаем представление с полным именем и адресом нежилого помещения

CREATE OR REPLACE
VIEW view_1 AS
SELECT
	CONCAT(users.first_name, ' ', users.last_name) AS full_name,
	other_estate.address AS address_of_other_estate
FROM
	users
JOIN estate ON
	users.id = estate.user_id
JOIN other_estate ON
	estate.other_estate_id = other_estate.id ;

SELECT * FROM view_1;

-- 2. Сделаем представление с полным именем, моделью авто и его мощностью. Отстортированный по мощности авто

CREATE OR REPLACE
VIEW view_2 AS
SELECT
	CONCAT(users.first_name, ' ', users.last_name) AS full_name,
	cars.model AS cars_model,
	cars.car_power AS car_power
FROM
	users
JOIN estate ON
	users.id = estate.user_id
JOIN cars ON
	estate.car_id = cars.id 
ORDER BY car_power ;

SELECT * FROM view_2;
