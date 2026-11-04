-- CUSTOMERWISE SUMMARY

{{ 
    config(
        materialized='view',
        tags=['customer', 'sales']
        ) 
}}

SELECT 
    C.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    SUM(S.AMOUNT) AS TOTAL_SALES_AMOUNT
FROM {{ ref('FCT_SALES') }} S
LEFT JOIN {{ ref('STG_CUSTOMERS') }} C ON S.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME