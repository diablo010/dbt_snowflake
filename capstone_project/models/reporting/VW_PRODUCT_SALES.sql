-- PRODUCTWISE SUMMARY

{{ 
    config(
        materialized='view',
        tags=['product']
        ) 
}}
SELECT 
    P.PRODUCT_ID,
    P.PRODUCT_NAME,
    SUM(S.AMOUNT) AS TOTAL_SALES_AMOUNT
FROM {{ ref('FCT_SALES') }} S
LEFT JOIN {{ ref('STG_PRODUCTS') }} P ON S.PRODUCT_ID = P.PRODUCT_ID
GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME