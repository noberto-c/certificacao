with source_person as (
    select * from {{ source('erp_adventureworks', 'person') }}
),

renamed as (
    select cast(BUSINESSENTITYID as int) as pk_person
    , FIRSTNAME || ' ' || LASTNAME as person_name
    from source_person
)

select * from renamed