SELECT avg( length(m.message_text) )
FROM ChirpMessages m
WHERE to_unix_timestamp( m.send_time ) >=
@arg
AND to_unix_timestamp( m.send_time ) <
@arg
