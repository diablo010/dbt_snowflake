{{config(materialized='view')}}

SELECT
    SALE_ID,
    SALE_DATE,
    CUSTOMER_ID,
    PRODUCT_ID,
    QUANTITY,
    AMOUNT
FROM {{source('raw', 'RAW_SALES')}}