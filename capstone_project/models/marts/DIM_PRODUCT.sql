{{ 
    config(
        materialized='table',
        tags=['dimension', 'product']
        ) 
}}
select 
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    PRICE
from {{ ref('STG_PRODUCTS') }}
