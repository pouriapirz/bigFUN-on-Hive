SELECT u.name, em.id, em.organization, em.start_date, em.end_date
FROM GleambookUsers u, Employment em
WHERE u.id = em.id
AND to_unix_timestamp( u.user_since ) >= 
@arg
AND to_unix_timestamp( u.user_since ) < 
@arg
AND NOT EXISTS (
SELECT *
FROM Employment e
WHERE e.id = u.id
AND e.end_date is NULL
)
ORDER BY u.name
