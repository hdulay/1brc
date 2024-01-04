with agg as (
    select
        city,
        avg(temp) as mean_measure,
        min(temp) as min_measure,
        max(temp) as max_measure
    from
        onebrc
    group by
        city
)
select
    CONCAT(
        CONCAT(CONCAT(city, mean_measure, '='), min_measure, '/'),
        max_measure,
        '/'
    )
from
    agg
order by
    city;
    