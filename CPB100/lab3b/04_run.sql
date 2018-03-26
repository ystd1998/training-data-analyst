use recommendation_spark;
select r.userid,        
        r.accoid,
        r.prediction,
        a.title,
        a.location,
        a.price,
        a.rooms,
        a.rating,
        a.type
from Recommendation as r,
        Accommodation as a
where r.accoid = a.id and
        r.userid = 10;
