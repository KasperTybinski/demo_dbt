-- 3.5 Number of albums produced by each artist.
select
    ar.artist_name,
    count(al.album_id) as nb_albums
from {{ ref('dim_artist') }} ar
left join {{ ref('dim_album') }} al
    on ar.artist_id = al.artist_id
group by ar.artist_id, ar.artist_name
order by nb_albums desc
