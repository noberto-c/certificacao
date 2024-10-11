with source_address as (
    select * from {{ source('erp_adventureworks', 'address') }}
),

renamed as (
    select addressid as pk_address
    , city
    , stateprovinceid as fk_stateprovince
    from source_address
)

select * from renamed