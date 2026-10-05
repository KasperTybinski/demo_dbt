-- 3.10 Average size of the songs by genre (bytes, also shown in MB).
select
    g.genre_name,
    avg(f.bytes)                       as avg_bytes,
    round(avg(f.bytes) / 1048576, 2)   as avg_mb
from {{ ref('fact_track') }} f
join {{ ref('dim_genre') }} g
    on f.genre_id = g.genre_id
group by g.genre_name
order by avg_bytes desc
