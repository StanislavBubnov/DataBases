-- 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

USE shop;

SELECT
	*
FROM
	products;

SHOW TRIGGERS;

DELIMITER //
CREATE TRIGGER new_insert BEFORE
INSERT
	ON
	products FOR EACH ROW BEGIN IF NEW.name IS NULL
	AND NEW.description IS NULL THEN SIGNAL SQLSTATE '45000' SET
	MESSAGE_TEXT = 'INSERT CANCELED';
END IF;
END //

INSERT
	INTO
	products (name, description, price, catalog_id)
VALUES (NULL, NULL, 7000, 1);

INSERT
	INTO
	products (name, description, price, catalog_id)
VALUES ('iPhone', 'XR', 47000, 2);

INSERT
	INTO
	products (name, description, price, catalog_id)
VALUES (NULL, 'XS max', 112000, 2);

DELIMITER //
CREATE TRIGGER new_update BEFORE
UPDATE
	ON
	products FOR EACH ROW BEGIN IF NEW.name IS NULL
	AND NEW.description IS NULL THEN SIGNAL SQLSTATE '45000' SET
	MESSAGE_TEXT = 'INSERT CANCELED';
END IF;
END //

UPDATE products
SET description = NULL 
WHERE id = 9;

