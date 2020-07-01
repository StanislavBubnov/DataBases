USE vk1;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
);

INSERT INTO `users` VALUES 
(1,'Геннадий','1990-10-05','2019-03-25 20:21:11','2019-03-25 20:21:11'),
(2,'Наталья','1984-11-12','2019-03-25 20:21:11','2019-03-25 20:21:11'),
(3,'Александр','1985-05-20','2019-03-25 20:21:11','2019-03-25 20:21:11'),
(4,'Сергей','1988-02-14','2019-03-25 20:21:11','2019-03-25 20:21:11'),
(5,'Иван','1998-01-12','2019-03-25 20:21:11','2019-03-25 20:21:11'),
(6,'Мария','2006-08-29','2019-03-25 20:21:11','2019-03-25 20:21:11');

SELECT * FROM users;

SELECT 
	name,
	birthday_at,
	CONCAT (YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10)) AS birtday_at_this_year,
	DAYNAME (CONCAT (YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS day_of_birthday_in_this_year
FROM
	users;
	
SELECT
	DAYNAME (CONCAT (YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS day_of_birthday_in_this_year,
	COUNT(DAYNAME (CONCAT (YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10)))) AS amount_of_birthday
FROM 
	users
GROUP BY
	day_of_birthday_in_this_year;