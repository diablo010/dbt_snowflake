{{config(materialized='view')}}

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CUSTOMER_SEGMENT,
    COUNTRY
FROM {{source('raw', 'RAW_CUSTOMERS')}}