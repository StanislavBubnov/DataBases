-- 4. Подсчитать общее количество лайков десяти самым молодым пользователям (сколько лайков получили 10 самых молодых пользователей).


USE vk;

SELECT
	*
FROM
	profiles;

SELECT
	*
FROM
	likes;

SELECT
	*
FROM
	profiles
LEFT JOIN likes ON
	profiles.user_id = target_id
	AND target_type_id = 2
ORDER BY
	birthday DESC
LIMIT 10;

SELECT
	SUM(young_likes) AS total_young_likes
FROM
	(
	SELECT
		COUNT(likes.id) as young_likes
	FROM
		profiles
	LEFT JOIN likes ON
		profiles.user_id = likes.target_id
		AND target_type_id = 2
	GROUP BY
		profiles.user_id
	ORDER BY
		profiles.birthday DESC
	LIMIT 10) AS young_ppl;

