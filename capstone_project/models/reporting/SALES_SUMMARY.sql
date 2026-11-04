-- WEEKLY SUMMARY

{{ 
    config(
        materialized='table',
        tags=['sales']
        ) 
}}
SELECT 
    EXTRACT(WEEK FROM S.SALE_DATE) AS SALE_WEEK,
    SUM(S.AMOUNT) AS TOTAL_SALES_AMOUNT
FROM {{ ref('FCT_SALES') }} S
GROUP BY EXTRACT(WEEK FROM S.SALE_DATE)