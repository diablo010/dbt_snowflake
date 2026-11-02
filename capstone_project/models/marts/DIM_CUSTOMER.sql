{{ config(materialized='table') }}

select 
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CUSTOMER_SEGMENT,
    COUNTRY
from {{ ref('STG_CUSTOMERS') }}
