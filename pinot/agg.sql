select
    city,
    avg(temp) as mean_measure,
    min(temp) as min_measure,
    max(temp) as max_measure
from
    "1brc"
group by
    city
order by
    city

