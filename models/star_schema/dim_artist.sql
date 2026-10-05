select
    artist_id,
    name        as artist_name,
    birth_year,
    country
from {{ source('music', 'ARTIST') }}
