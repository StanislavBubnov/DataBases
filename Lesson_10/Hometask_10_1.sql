-- 1. Проанализировать какие запросы могут выполняться наиболее
-- часто в процессе работы приложения и добавить необходимые индексы.

USE vk;

CREATE INDEX first_name_user_idx ON users(first_name);

CREATE INDEX last_name_user_idx ON users(last_name);

CREATE INDEX email_user_idx ON users(email);

CREATE INDEX phone_user_idx ON users(phone);

SHOW INDEX FROM users;

CREATE INDEX birthday_profiles_idx ON profiles(birthday);

CREATE INDEX messages_from_user_id_to_user_id_idx ON messages(from_user_id, to_user_id);

CREATE INDEX messages_to_user_id_from_user_id_idx ON messages(to_user_id, from_user_id);

CREATE INDEX media_filename_idx ON media(filename);

CREATE INDEX posts_head_idx ON posts(head);

CREATE INDEX posts_body_idx ON posts(body); Не работет с типом BLOB