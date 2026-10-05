-- Step 3: model using the macro.
-- (The notebook's version selects "from pop" while the CTE is called demographics,
--  which fails. Here the names match.)
with pop as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),

final as (
    select {{ divide_by_hundred('total_population') }} as divide
    from pop
)

select * from final
