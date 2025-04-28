with

source as (

    select 
        -- identifiers
        unique_row_id,
        name,
        pid,
        artist_name,
        track_name
    from {{ source('raw_mp', 'mp') }}

)

select * from source

-- {% if var('is_test_run', default=true) %}
--   limit 100
-- {% endif %}
