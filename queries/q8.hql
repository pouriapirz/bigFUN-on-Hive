SELECT m.user_screen_name, avg( length(m.message_text) ) AS mlAvg
FROM ChirpMessages m
WHERE to_unix_timestamp( m.send_time ) >= 
@arg
AND to_unix_timestamp( m.send_time ) <
@arg
GROUP BY m.user_screen_name
ORDER BY mlAvg DESC
LIMIT 10
