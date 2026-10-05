with tracks as (
    select * from {{ source('music', 'TRACK') }}
),

albums as (
    select * from {{ source('music', 'ALBUM') }}
),

final as (
    select
        tracks.track_id,
        tracks.name          as track_name,
        tracks.composer,
        tracks.album_id,
        albums.artist_id,
        tracks.genre_id,
        tracks.media_type_id,
        tracks.milliseconds,
        tracks.bytes,
        tracks.unit_price
    from tracks
    left join albums
        on tracks.album_id = albums.album_id
)

select * from final
