{% snapshot customer_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='CUSTOMER_ID',
        strategy='check',
        check_cols=['CUSTOMER_SEGMENT']
    )
}}

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    COUNTRY,
    CUSTOMER_SEGMENT
FROM {{ ref('STG_CUSTOMERS') }}

{% endsnapshot %}