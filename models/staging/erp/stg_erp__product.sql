with source_product as (
    select * from {{ source('erp_adventureworks', 'product') }}
),

renamed as (
    select productid as pk_product
    , name as product_name
    from source_product
)

select * from renamed