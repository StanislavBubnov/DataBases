USE vk;

DESC users; 

SELECT * FROM users;

ALTER TABLE users MODIFY COLUMN created_at DATETIME;

ALTER TABLE users MODIFY COLUMN updated_at DATETIME;
