select * from
(select u.id as uc0, u.alias as uc1, u.name as uc2, u.user_since as uc3, null as ec4, null as ec5, null as ec6, null as fc7
from GleambookUsers u
WHERE
to_unix_timestamp( u.user_since ) >= 
@arg
AND
to_unix_timestamp( u.user_since ) < 
@arg
UNION ALL
select u2.id as uc0, null as uc1, null as uc2, null as uc3, e.organization as ec4, e.start_date as ec5, e.end_date as ec6, null as fc7
from GleambookUsers u2 JOIN Employment e ON u2.id = e.id 
WHERE
to_unix_timestamp( u2.user_since ) >= 
@arg
AND
to_unix_timestamp( u2.user_since ) < 
@arg
UNION ALL
select u3.id as uc0, null as uc1, null as uc2, null as uc3, null as ec4, null as ec5, null as ec6, f.frid as fc7
from GleambookUsers u3 JOIN FriendIds f ON u3.id = f.id
WHERE
to_unix_timestamp( u3.user_since ) >= 
@arg
AND
to_unix_timestamp( u3.user_since ) < 
@arg
) results
ORDER BY uc0
