with creditcard as (
    select * from {{ ref('stg_erp__creditCard') }}
)

select * from creditcard