-- 2. Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах
-- самый молодой пользователь в группе
-- самый старший пользователь в группе
-- общее количество пользователей в группе
-- всего пользователей в системе
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

USE vk;
       
SELECT
	DISTINCT communities.id,
	communities.name,
	COUNT(communities_users.user_id) OVER(PARTITION BY communities.id) AS total_users_in_group,
	COUNT(communities_users.user_id) OVER() / (
	SELECT
		COUNT(communities.id)
	FROM
		communities) AS avg_users_in_group,
	MAX(profiles.birthday) OVER(PARTITION BY communities.id) AS youngest_user_in_group,
	MIN(profiles.birthday) OVER(PARTITION BY communities.id) AS older_user_in_group,
	COUNT(profiles.user_id) OVER() AS total_users,
	COUNT(communities_users.user_id) OVER(PARTITION BY communities.id) / COUNT(profiles.user_id) OVER() * 100 AS "%%"
FROM
	communities
JOIN communities_users ON
	communities.id = communities_users.community_id
JOIN profiles ON
	communities_users.user_id = profiles.user_id;

SELECT
	DISTINCT communities.id,
	communities.name,
	COUNT(communities_users.user_id) OVER w AS total_users_in_group,
	COUNT(communities_users.user_id) OVER() / (
	SELECT
		COUNT(communities.id)
	FROM
		communities) AS avg_users_in_group,
	MAX(profiles.birthday) OVER w AS youngest_user_in_group,
	MIN(profiles.birthday) OVER w AS older_user_in_group,
	COUNT(profiles.user_id) OVER() AS total_users,
	COUNT(communities_users.user_id) OVER w / COUNT(profiles.user_id) OVER() * 100 AS "%%"
FROM
	communities
JOIN communities_users ON
	communities.id = communities_users.community_id
JOIN profiles ON
	communities_users.user_id = profiles.user_id WINDOW w AS (PARTITION BY communities.id);
	
