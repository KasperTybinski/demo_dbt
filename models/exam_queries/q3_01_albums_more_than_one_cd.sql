-- 3.1 Titles of the albums that have more than 1 CD.
-- Note: despite its name, CD_YEAR holds the number of CDs in the album.
select
    title,
    cd_year
from {{ ref('dim_album') }}
where cd_year > 1
order by title
