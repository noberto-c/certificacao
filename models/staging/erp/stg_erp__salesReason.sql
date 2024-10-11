with source_salesreason as (
    select * from {{ source('erp_adventureworks', 'salesreason') }}
),

renamed as (
    select salesreasonid as pk_salesreason
    , name
    from source_salesreason
)

select * from renamed