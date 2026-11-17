
{{ config(
    materialized='table',
    database='DEA_BATCH_SCD2',
    schema='transformed',
    alias='product_transformed'
) }}

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    UNIT_PRICE,
    QUANTITY,
    SUPPLIER_NAME,
    UPDATED_AT
FROM DEA_BATCH_SCD2.RAW.PRODUCT_RAW
