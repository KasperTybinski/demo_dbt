select
    album_id,
    title,
    artist_id,
    prod_year,
    cd_year     -- number of CDs in the album, despite its name
from {{ source('music', 'ALBUM') }}
