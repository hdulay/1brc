select
    city,
    avg(temp) as mean_measure,
    min(temp) as min_measure,
    max(temp) as max_measure
from
    onebrc
group by
    city
order by
    city

