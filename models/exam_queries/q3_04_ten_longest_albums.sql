-- 3.4 The 10 longest albums (total duration of their tracks).
select
    a.title,
    round(sum(f.milliseconds) / 60000, 1) as duration_minutes
from {{ ref('fact_track') }} f
join {{ ref('dim_album') }} a
    on f.album_id = a.album_id
group by a.album_id, a.title
order by sum(f.milliseconds) desc
limit 10
