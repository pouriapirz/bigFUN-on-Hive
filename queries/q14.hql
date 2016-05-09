SELECT u.id, count(*) AS mCount
FROM GleambookUsers u JOIN GleambookMessages m
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
GROUP BY u.id
