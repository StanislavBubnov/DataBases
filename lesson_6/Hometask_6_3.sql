-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

USE vk; 

SELECT * FROM profiles;

SELECT (SELECT gender FROM profiles WHERE user_id = likes.user_id) FROM likes;
    
 SELECT
	(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender, 
	COUNT(*) AS total
    FROM likes
    GROUP BY gender
    ORDER BY total;