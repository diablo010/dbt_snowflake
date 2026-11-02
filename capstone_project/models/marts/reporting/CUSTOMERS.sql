{{ config(materialized='table') }}

SELECT 
    DISTINCT CUSTOMER_ID
FROM {{ ref('FACT_SALES') }} 
