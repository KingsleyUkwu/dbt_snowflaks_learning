
{% snapshot customers_snapshot %}

{{
    config(
        target_schema='SNAPSHOT',
        unique_key='CUSTOMER_ID',
        strategy='check',
        check_cols=['FIRST_NAME', 'LAST_NAME', 'EMAIL'],
        invalidate_hard_deletes=True
    )
}}

SELECT
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    CREATED_AT,
    UPDATED_AT
FROM {{ ref('stg_customers') }}

{% endsnapshot %}
