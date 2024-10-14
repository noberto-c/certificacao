with salesOrderReason as (
    select * from {{ ref('int_salesOrderReason') }}
)

select * from salesOrderReason