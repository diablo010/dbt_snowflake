{{
    config(
      materialized='incremental',
      unique_key='sale_id',
      incremental_strategy='merge'
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
WHERE SALE_DATE > (SELECT MAX(SALE_DATE) FROM {{ this }})
{% endif %}
