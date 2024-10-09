with source_customer as (
    select * from {{ source('erp_adventureworks', 'customer') }}
),

renamed as (
    select cast(customerid as int) as pk_customer
    , personid as fk_person
    , storeid as fk_store
    , territoryid as fk_territory
    from source_customer
)

select * from renamed