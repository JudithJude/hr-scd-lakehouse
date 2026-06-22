# hr-scd-lakehouse

A hands-on analytics engineering project implementing dimensional modeling, all four major Slowly Changing Dimension (SCD) patterns, and Delta Lake internals, built on Databricks with Unity Catalog, using the IBM HR Analytics Employee Attrition dataset.

This project follows a 4-week self-study plan, implementing every concept hands-on rather than just conceptually.

## Stack

- **Platform:** Databricks (Unity Catalog, Git folders)
- **Storage:** Delta Lake, managed Delta tables
- **Dataset:** [IBM HR Analytics Employee Attrition](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) (Kaggle, 1,470 rows, 35 columns)
- **Languages:** SQL, PySpark

## Project Structure
ibm_hr (catalog)

├── source   — raw CSV landed via Unity Catalog Volume

├── bronze   — raw ingested table

└── silver   — dimensional model + SCD variants

| Notebook | Purpose |
|---|---|
| `01_bronze_ingestion` | Ingest raw IBM HR CSV into a managed Delta table |
| `02_silver_dimensional_model` | Split into `dim_employee` (descriptive attributes) and `fact_employee_metrics` (measurable numbers) |
| `03_scd_type1` | SCD Type 1 — overwrite/UPSERT |
| `04_scd_type2` | SCD Type 2 — full version history via surrogate key + `from_date`/`to_date`/`in_use_flag` |
| `05_scd_type3` | SCD Type 3 — current value + one `previous_X` column |
| `06_scd_type6` | SCD Type 6 — hybrid of Types 1, 2, and 3 on one table |
| `07_delta_internals` | Delta Lake internals — `DESCRIBE DETAIL`, `DESCRIBE HISTORY`, time travel, ACID properties, table types |

## What's covered

- Dimensional modeling: facts vs. dimensions, surrogate keys, star/snowflake schema
- All four SCD types, implemented and verified on live Delta tables
- Delta Lake internals: transaction log, deletion vectors, time travel, ACID guarantees
- Table types (Managed vs. External vs. Transient) and file format fundamentals (Parquet vs. JSON vs. CSV)

Full write-up with definitions, the actual SQL used, and real outputs (including a bug encountered and fixed during SCD Type 6 implementation) is in [`docs/week1-reference-guide.md`](https://docs.google.com/document/d/1cnmtW4rvLvbTh9qq7GvNTjXnr686CeJYp7CQRNcH5RU/edit?tab=t.pvxp0yjxkn0n).

## Roadmap

This is Week 1 of a 4-week plan. Upcoming:
- **Week 2:** dbt (staging/marts modeling, testing, incremental models, docs)
- **Week 3:** Spark deep-dive + Airflow orchestration
- **Week 4:** Snowflake, Azure ecosystem, Power BI, file format deep-dive