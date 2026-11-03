{{ config(materialized='table') }}

SELECT 
    DISTINCT CUSTOMER_ID
FROM {{ ref('FCT_SALES') }} 
