with source_countryregion as (
    select * from {{ source('erp_adventureworks', 'countryregion') }}
),

renamed as (
    select countryregioncode as pk_countryregioncode
    , name as countryregion_name
    from source_countryregion
)

select * from renamed