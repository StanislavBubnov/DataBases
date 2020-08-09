
-- 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('1', 'Robert Wuckert III', '1994-02-11 20:14:40');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('2', 'Jose Schuppe', '1987-03-09 22:41:07');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('3', 'Graham Gottlieb', '1977-05-05 16:07:27');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('4', 'Mrs. Marilie Schultz', '1981-01-04 08:06:34');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('5', 'Mya Schultz', '2009-03-14 15:40:41');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('6', 'Hyman Rosenbaum', '1979-02-01 16:57:11');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('7', 'Dejon Gleason', '1982-09-04 16:22:05');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('8', 'Mrs. Shaniya Franecki', '1995-09-26 06:16:18');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('9', 'Aniyah Rosenbaum', '1979-02-01 02:28:55');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('10', 'Rahsaan Douglas Sr.', '1972-03-13 12:11:45');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('11', 'Yessenia Lakin', '1986-12-13 06:00:02');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('12', 'Kellen Spencer', '2008-03-08 05:17:09');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('13', 'Maymie Borer III', '1983-09-03 20:42:11');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('14', 'Helmer Haag', '2020-01-05 17:38:51');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('15', 'Morgan O\'Conner', '1979-09-03 14:42:37');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('16', 'Dr. Earl Becker', '2019-12-09 03:03:01');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('17', 'Mrs. Colleen Abbott DDS', '1988-10-13 05:29:48');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('18', 'Miss Lindsay Rodriguez', '2007-04-08 13:42:25');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('19', 'Loy Graham', '1994-09-14 08:04:33');
INSERT INTO `test` (`id`, `name`, `created_at`) VALUES ('20', 'Javier Cruickshank', '2002-03-29 02:18:15');

SELECT * FROM test;

DELETE
	test
FROM
	test
JOIN (
	SELECT
		*
	FROM
		test
	ORDER BY
		created_at
	LIMIT 15) AS delete_list ON
	test.created_at <= delete_list.created_at;

SELECT
	*
FROM
	test
ORDER BY
	created_at;