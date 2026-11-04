{{
    config(
      materialized='incremental',
      incremental_strategy='insert_overwrite',
      partition_by={            
      'field': 'sale_date',
      'data_type': 'date'
      },
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
WHERE SALE_DATE >= DATEADD(day, -1, CURRENT_DATE())
{% endif %}

-- previously date_sub was used which is not available in snowflake, so changed to dateadd function