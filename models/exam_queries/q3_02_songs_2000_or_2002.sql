-- 3.2 Songs produced in 2000 or 2002 (production year of their album).
select
    f.track_name,
    a.title as album_title,
    a.prod_year
from {{ ref('fact_track') }} f
join {{ ref('dim_album') }} a
    on f.album_id = a.album_id
where a.prod_year in (2000, 2002)
