with person as (
    select * from {{ ref('stg_erp__person') }}
),

customer as (
    select * from {{ ref('stg_erp__customer') }}
),

joined as (
    select customer.pk_customer
    , person.person_name as customer_name
    , customer.fk_store
    , customer.fk_territory
    from person
    inner join customer on customer.fk_person = person.pk_person
)

select * from joined