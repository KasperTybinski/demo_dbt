-- 3.9 Rock songs whose artists are in France.
select
    f.track_name,
    ar.artist_name
from {{ ref('fact_track') }} f
join {{ ref('dim_genre') }} g
    on f.genre_id = g.genre_id
join {{ ref('dim_artist') }} ar
    on f.artist_id = ar.artist_id
where g.genre_name = 'Rock'
  and ar.country = 'France'
