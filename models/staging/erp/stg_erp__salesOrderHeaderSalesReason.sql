with source_salesorderheadersalesreason as (
    select * from {{ source('erp_adventureworks', 'salesorderheadersalesreason') }}
),

renamed as (
    select salesorderid as fk_salesorderid
    , salesreasonid as fk_salesreasonid
    from source_salesorderheadersalesreason
)

select * from renamed