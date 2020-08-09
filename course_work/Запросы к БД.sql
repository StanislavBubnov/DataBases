USE fns;
	
-- 1. Найдем имя налогоплательщика с самым мощным автомобилем

SELECT * from users LEFT JOIN estate ON users.id = estate.user_id;

SELECT * from users LEFT JOIN estate ON users.id = estate.user_id;

SELECT cars.id FROM cars WHERE car_power = (SELECT MAX(car_power) FROM cars);

SELECT user_id FROM estate WHERE car_id = (SELECT cars.id FROM cars WHERE car_power = (SELECT MAX(car_power) FROM cars));

SELECT
	first_name
FROM
	users
WHERE
	id = (
	SELECT
		user_id
	FROM
		estate
	WHERE
		car_id = (
		SELECT
			cars.id
		FROM
			cars
		WHERE
			car_power = (
			SELECT
				MAX(car_power)
			FROM
				cars))); COMMENT 'Способ через SELECT'

SELECT
	first_name
FROM
	users
JOIN estate ON
	estate.user_id = users.id
JOIN cars ON
	estate.car_id = cars.id
WHERE
	cars.id = (
	SELECT
		cars.id
	FROM
		cars
	WHERE
		car_power = (
		SELECT
			MAX(car_power)
		FROM
			cars)) COMMENT 'Способ с Join';
		
-- 2. Найдем имя 10 налогоплательщиков с самым большим доходом.

SELECT * FROM income;

SELECT
	CONCAT(users.first_name, ' ', users.last_name) AS full_name,
	income.income AS income
FROM
	users
JOIN income ON
	users.id = income.user_id
ORDER BY
	income DESC
LIMIT 10;

-- 3. Найдем процентное отношение самого большого дохода одного налогоплательщика к всему доходу всех налогоплательщиков

SELECT
	MAX(income.income)/ SUM(income.income)
FROM
	income;

-- 4. Сгрупируем доходы налогоплательщиков по странам

SELECT * FROM income;

SELECT
	country,
	COUNT(users.id) AS total_users_in_country,
	SUM(income.income) AS total_income_in_country
FROM
	profiles
JOIN users ON
	profiles.user_id = users.id
LEFT JOIN income ON
	users.id = income.user_id
GROUP BY
	country
ORDER BY total_income_in_country DESC;
