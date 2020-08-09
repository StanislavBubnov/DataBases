-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

USE vk1;

CREATE TABLE users_test (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR (255), created_at datetime DEFAULT current_timestamp());

DROP PROCEDURE IF EXISTS insert_users;

delimiter //
CREATE PROCEDURE insert_users (IN i INT) COMMENT ''
BEGIN
	DECLARE q INT;
	SET q = 0;
	WHILE q < i DO
	INSERT INTO users_test(id, name, created_at) VALUES (NULL, CONCAT('user_', q), NOW());
	SET q = q + 1;
	END WHILE;
END //
delimiter ;

CALL insert_users(15);

SELECT * FROM users_test;

DELETE FROM users_test;