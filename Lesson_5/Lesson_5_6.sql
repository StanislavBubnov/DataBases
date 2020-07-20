USE vk;
SELECT * FROM users;
SELECT ROUND (AVG ((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25), 0) AVG_Age FROM users;
