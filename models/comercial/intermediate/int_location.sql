with address as (
    select * from {{ ref('stg_erp__address') }}
),

stateProvince as (
    select * from {{ ref('stg_erp__stateProvince') }}
),

countryRegion as (
    select * from {{ ref('stg_erp__countryRegion') }}
),

joined as (
    select address.pk_address
    , address.city
    , stateProvince.stateprovince_name as state_name
    , countryRegion.countryregion_name as country_name
    from address
    inner join stateProvince on stateProvince.pk_stateprovince = address.fk_stateprovince
    inner join countryRegion on countryRegion.pk_countryregioncode = stateProvince.fk_countryregioncode
)

select * from joined