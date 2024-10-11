with salesreason as (
    select * from {{ ref('stg_erp__salesReason') }}
)

select * from salesreason