select
    media_type_id,
    name as media_type_name
from {{ source('music', 'MEDIA_TYPE') }}
