select * from
(select u.id as uc0, u.alias as uc1, u.name as uc2, u.user_since as uc3, null as ec4, null as ec5, null as ec6, null as fc7
from GleambookUsers u
where u.id >=
@arg
AND u.id <
@arg
UNION ALL
select null as uc0, null as uc1, null as uc2, null as uc3, e.organization as ec4, e.start_date as ec5, e.end_date as ec6, null as fc7
from Employment e
where  e.id >=
@arg
AND e.id <
@arg
UNION ALL
select null as uc0, null as uc1, null as uc2, null as uc3, null as ec4, null as ec5, null as ec6, f.frid as fc7
from FriendIds f
where f.id >=
@arg
AND f.id <
@arg
) results
ORDER BY uc0
