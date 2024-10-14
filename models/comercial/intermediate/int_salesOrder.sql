with salesorderheader as (
    select * from {{ ref('stg_erp__salesOrderHeader') }}
),

salesorderdetail as (
    select * from {{ ref('stg_erp__salesOrderDetail') }}
),

joined as (
    select salesorderheader.pk_salesorderid::varchar || '-' || salesorderdetail.pk_salesorderdetailid::varchar as pk_salesorder
    , salesorderheader.pk_salesorderid as salesorderid
    , salesorderheader.fk_customer
    , salesorderheader.fk_creditcard
    , salesorderdetail.fk_product
    , cast(salesorderheader.orderdate as date) as order_date
    , salesorderdetail.orderqty as order_qty
    , salesorderdetail.unitprice as unit_price
    , salesorderdetail.unitpricediscount as unit_price_discount
    , (salesorderdetail.orderqty * salesorderdetail.unitprice) as gross_value
    , (salesorderdetail.orderqty * salesorderdetail.unitprice) * (1 - salesorderdetail.unitpricediscount) as net_price
    from salesorderheader
    inner join salesorderdetail on salesorderheader.pk_salesorderid = salesorderdetail.fk_salesorderid
)

select * from joined