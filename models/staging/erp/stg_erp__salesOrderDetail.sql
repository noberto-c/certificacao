with source_salesorderdetail as (
    select * from {{ source('erp_adventureworks', 'salesorderdetail') }}
),

renamed as (
    select salesorderdetailid as pk_salesorderdetailid
    , salesorderid as fk_salesorderid
    , productid as fk_product
    , orderqty
    , unitprice
    , unitpricediscount
    from source_salesorderdetail
)

select * from renamed