select
    city,
    avg(temp) mean_measure,
    min(temp) min_measure,
    max(temp) max_measure
from
    "1brc"
group by
    city
order by
    city

