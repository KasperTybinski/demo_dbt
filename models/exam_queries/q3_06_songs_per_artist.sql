-- 3.6 Number of songs produced by each artist.
select
    ar.artist_name,
    count(f.track_id) as nb_songs
from {{ ref('dim_artist') }} ar
left join {{ ref('fact_track') }} f
    on ar.artist_id = f.artist_id
group by ar.artist_id, ar.artist_name
order by nb_songs desc
