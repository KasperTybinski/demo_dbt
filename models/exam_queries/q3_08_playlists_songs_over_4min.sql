-- 3.8 Playlists containing songs longer than 4 minutes.
select distinct
    p.playlist_name
from {{ ref('dim_playlist') }} p
join {{ ref('bridge_playlist_track') }} pt
    on p.playlist_id = pt.playlist_id
join {{ ref('fact_track') }} f
    on pt.track_id = f.track_id
where f.milliseconds > 4 * 60 * 1000
