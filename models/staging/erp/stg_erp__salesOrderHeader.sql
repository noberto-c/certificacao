with source_salesorderheader as (
    select * from {{ source('erp_adventureworks', 'salesorderheader') }}
),

renamed as (
    select salesorderid as pk_salesorderid
    , customerid as fk_customer
    , creditcardid as fk_creditcard
    , orderdate
    from source_salesorderheader
)

select * from renamed