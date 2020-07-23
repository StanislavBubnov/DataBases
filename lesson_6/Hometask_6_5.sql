-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети

SELECT 
  	id, 
	(SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS activities 
	  FROM users
	  ORDER BY activities
	  LIMIT 10;