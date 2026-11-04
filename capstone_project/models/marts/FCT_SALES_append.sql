{{
    config(
      materialized='incremental',
      incremental_strategy='append',
      tags=['sales', 'fact']
    )
}}

SELECT 
    SALE_ID,
    SALE_DATE,
    CUSTOMER_ID,
    PRODUCT_ID,
    QUANTITY,
    AMOUNT
FROM {{ ref('STG_SALES') }} 

{% if is_incremental() %}
    -- Only select rows newer than the latest timestamp already in the target table
WHERE SALE_DATE > (SELECT MAX(SALE_DATE) FROM {{ this }})
{% endif %}
