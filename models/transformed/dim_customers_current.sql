
{{ config(materialized='table') }}

SELECT
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    CREATED_AT,
    UPDATED_AT,
    DBT_VALID_FROM
FROM {{ ref('customers_snapshot') }}
WHERE DBT_VALID_TO IS NULL
