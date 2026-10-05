-- 3.3 Name and composer of the Rock and Jazz songs.
select
    f.track_name,
    f.composer,
    g.genre_name
from {{ ref('fact_track') }} f
join {{ ref('dim_genre') }} g
    on f.genre_id = g.genre_id
where g.genre_name in ('Rock', 'Jazz')
