-- 3.11 Playlists containing songs of artists born before 1990.
select distinct
    p.playlist_name
from {{ ref('dim_playlist') }} p
join {{ ref('bridge_playlist_track') }} pt
    on p.playlist_id = pt.playlist_id
join {{ ref('fact_track') }} f
    on pt.track_id = f.track_id
join {{ ref('dim_artist') }} ar
    on f.artist_id = ar.artist_id
where ar.birth_year < 1990
