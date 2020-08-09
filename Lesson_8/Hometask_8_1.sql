-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

USE vk;

SELECT
	*
FROM
	likes;

DESC profiles;

SELECT
	profiles.gender,
	COUNT(*) AS total
FROM
	profiles
JOIN likes ON
	profiles.user_id = likes.user_id
GROUP BY
	gender;
