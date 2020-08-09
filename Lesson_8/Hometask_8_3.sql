-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
-- (критерии активности необходимо определить самостоятельно).

USE vk;

SELECT
	users.id,
	COUNT(DISTINCT messages.id) AS activities
FROM
	users
LEFT JOIN messages ON
	users.id = messages.from_user_id
GROUP BY
	users.id
ORDER BY
	activities
LIMIT 10;