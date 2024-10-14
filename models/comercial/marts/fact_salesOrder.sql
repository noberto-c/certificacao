with salesOrder as (
    select * from {{ ref('int_salesOrder') }}
)

select * from salesOrder