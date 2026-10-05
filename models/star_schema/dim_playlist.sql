select
    playlist_id,
    name as playlist_name
from {{ source('music', 'PLAYLIST') }}
