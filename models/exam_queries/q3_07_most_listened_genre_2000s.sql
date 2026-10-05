-- 3.7 Most listened-to genre in the 2000s.
-- There is no listening data, so "listened to" is measured here as the number
-- of playlist entries for tracks from albums produced 2000-2009.
select
    g.genre_name,
    count(*) as nb_playlist_entries
from {{ ref('bridge_playlist_track') }} pt
join {{ ref('fact_track') }} f
    on pt.track_id = f.track_id
join {{ ref('dim_album') }} a
    on f.album_id = a.album_id
join {{ ref('dim_genre') }} g
    on f.genre_id = g.genre_id
where a.prod_year between 2000 and 2009
group by g.genre_name
order by nb_playlist_entries desc
limit 1
