/* 
    Carlos mencionou que as vendas brutas no ano de 2011 foram de $12.646.112,16.
*/

with int_salesOrder as (
    select * from {{ ref('int_salesOrder') }}
),

test as (
select sum(gross_value) gross_value 
from int_salesOrder 
where extract(year from order_date) = 2011
)

select gross_value
from test 
where gross_value not between 12646112.10 and 12646112.20
