with source_creditcard as (
    select * from {{ source('erp_adventureworks', 'creditcard') }}
),

renamed as (
    select creditcardid as pk_creditcard
    , cardtype
    from source_creditcard
)

select * from renamed