
# DEA Data Engineering Project — dbt and Snowflake

## Project Overview
This project demonstrates customer data transformation,
historical change tracking, and data quality validation
using dbt and Snowflake.

## Data Pipeline Architecture
MySQL (source) → AWS Glue → Amazon S3 → Snowflake → dbt

The AWS ingestion and loading components are part of
the broader DEA pipeline and are documented separately
from the dbt transformations verified here.

## dbt Models
1. stg_customers
   - Prepares customer records for downstream processing.

2. customers_snapshot
   - Implements Slowly Changing Dimension Type 2 (SCD2).
   - Tracks changes to FIRST_NAME, LAST_NAME, and EMAIL.
   - Maintains historical records with DBT_VALID_FROM
     and DBT_VALID_TO.

3. dim_customers_current
   - Selects only currently active customer records.
   - Provides one current record per CUSTOMER_ID.

## Validation Results
- Snapshot history verified.
- 7 snapshot records: 4 active and 3 historical.
- Current customer dimension contains 4 records.
- No duplicate CUSTOMER_ID values.
- Unique and not-null dbt tests passed.
- dbt build completed successfully.
- Model lineage verified in dbt Studio.

## Technologies
- MySQL
- AWS Glue
- Amazon S3
- Snowflake
- dbt Cloud
- SQL
- Git version control

## Project Status
dbt SCD2 snapshot, current customer dimension,
and validation completed successfully.
