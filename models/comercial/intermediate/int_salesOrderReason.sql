with salesreason as (
    select * from {{ ref('stg_erp__salesReason') }}
),

salesorderheadersalesreason as (
    select * from {{ ref('stg_erp__salesOrderHeaderSalesReason') }}
),

joined as (
    select sohsr.fk_salesorderid
    , salesreason.pk_salesreason as fk_salesreason
    from salesreason
    inner join salesorderheadersalesreason sohsr on sohsr.fk_salesreasonid = salesreason.pk_salesreason
)

select * from joined