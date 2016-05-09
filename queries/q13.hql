SELECT u.name, m.message
FROM GleambookUsers u LEFT OUTER JOIN GleambookMessages m
ON m.author_id = u.id
WHERE
to_unix_timestamp( u.user_since ) >= 
@arg 
AND
to_unix_timestamp( u.user_since ) < 
@arg
AND to_unix_timestamp( m.send_time ) >=
@arg
AND to_unix_timestamp( m.send_time ) <
@arg
ORDER BY u.name
