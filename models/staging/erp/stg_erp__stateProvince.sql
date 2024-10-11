with source_stateprovince as (
    select * from {{ source('erp_adventureworks', 'stateprovince') }}
),

renamed as (
    select stateprovinceid as pk_stateprovince
    , name as stateprovince_name
    , countryregioncode as fk_countryregioncode
    from source_stateprovince
)

select * from renamed