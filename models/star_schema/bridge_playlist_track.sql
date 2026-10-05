select
    playlist_id,
    track_id
from {{ source('music', 'PLAYLIST_TRACK') }}
