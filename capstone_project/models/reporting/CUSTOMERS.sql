{{ 
    config(
        materialized='table',
        tags=['customer']
        ) 
}}

SELECT 
    DISTINCT CUSTOMER_ID
FROM {{ ref('FCT_SALES') }} 
