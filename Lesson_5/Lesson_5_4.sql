CREATE TEMPORARY TABLE users_n (id INT PRIMARY KEY AUTO_INCREMENT, birthday_month VARCHAR(100))

INSERT INTO users_n (birthday_month) VALUES
	('febrary'),
	('may'),
	('august'),
	('november'),
	('october');

SELECT * FROM users_n;

SELECT * FROM users_n WHERE birthday_month RLIKE 'may|august';