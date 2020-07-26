-- 2. (по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, имя пользователя и его пароль. 
-- Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
-- Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.


USE shop;

SHOW TABLES;


CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'user',
  pass VARCHAR(255) COMMENT 'password');
 
INSERT INTO `accounts` (`id`, `name`, `pass`) VALUES ('1', 'Jayson', 'quidem');
INSERT INTO `accounts` (`id`, `name`, `pass`) VALUES ('2', 'Eli', 'sed');
INSERT INTO `accounts` (`id`, `name`, `pass`) VALUES ('3', 'Felicita', 'minus');
INSERT INTO `accounts` (`id`, `name`, `pass`) VALUES ('4', 'Giovanny', 'quis');
INSERT INTO `accounts` (`id`, `name`, `pass`) VALUES ('5', 'Elisabeth', 'pariatur');
 
SELECT * FROM accounts;
  
CREATE OR REPLACE VIEW accounts_view (id, name) AS SELECT accounts.id, accounts.name FROM accounts;

SELECT * FROM accounts_view;

CREATE USER user_read;

GRANT SELECT (id,name) ON shop.accounts_view TO user_read;

SELECT Host, User FROM mysql.user;

DROP USER shop, shop_read, user_read;