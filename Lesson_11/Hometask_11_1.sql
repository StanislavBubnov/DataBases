-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs 
-- помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.



USE vk1;

DROP TABLE IF EXISTS users;

CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR (255), city VARCHAR(255));

DROP TABLE IF EXISTS logs;

CREATE TABLE logs ( id INT, table_name VARCHAR(255), name_in_table VARCHAR(255), created_at datetime DEFAULT current_timestamp() ) ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS users_log;
delimiter //
CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (id, table_name, name_in_table, created_at)
	VALUES (NEW.id, 'users', NEW.name, NOW());
END //
delimiter ;

INSERT INTO `users` (`id`, `name`, `city`) VALUES (1, 'Minerva', 'New Caroline');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (2, 'Leonor', 'Sophialand');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (3, 'Blake', 'Aniyahaven');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (4, 'Lance', 'South Raegan');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (5, 'Lavada', 'Celestinoburgh');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (6, 'Jada', 'Rodrigotown');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (7, 'Gaston', 'New Georgianabury');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (8, 'Vivienne', 'New Marshallport');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (9, 'Pat', 'West Daisy');
INSERT INTO `users` (`id`, `name`, `city`) VALUES (10, 'Electa', 'Tyrellton');

SELECT * FROM users;

SELECT * FROM logs;

SHOW TRIGGERS FROM vk1

DROP TRIGGER IF EXISTS catalogs_log;
delimiter //
CREATE TRIGGER catalogs_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (id, table_name, name_in_table, created_at)
	VALUES (NEW.id, 'catalogs', NEW.name, NOW());
END //
delimiter ;

DROP TRIGGER IF EXISTS products_log;
delimiter //
CREATE TRIGGER products_log AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (id, table_name, name_in_table, created_at)
	VALUES (NEW.id, 'products', NEW.name, NOW());
END //
delimiter ;