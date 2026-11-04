{{ 
    config(
        materialized='table',
        tags=['sales']
        ) 
}}

SELECT 
    C.COUNTRY,
    P.CATEGORY,
    SUM(S.AMOUNT) AS TOTAL_PURCHASES
FROM {{ ref('FCT_SALES') }} S
LEFT JOIN {{ ref('STG_CUSTOMERS') }} C ON S.CUSTOMER_ID = C.CUSTOMER_ID
LEFT JOIN {{ ref('STG_PRODUCTS') }} P ON S.PRODUCT_ID = P.PRODUCT_ID
GROUP BY C.COUNTRY, P.CATEGORY