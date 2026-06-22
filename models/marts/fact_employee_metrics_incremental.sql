{{
  config(
    materialized='incremental',
    unique_key='employee_id'
  )
}}

SELECT
    employee_id,
    MonthlyIncome,
    DailyRate,
    HourlyRate,
    MonthlyRate,
    JobSatisfaction,
    EnvironmentSatisfaction,
    WorkLifeBalance,
    RelationshipSatisfaction,
    PerformanceRating,
    PercentSalaryHike,
    YearsAtCompany,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager,
    TotalWorkingYears,
    NumCompaniesWorked,
    TrainingTimesLastYear,
    StockOptionLevel
FROM {{ ref('stg_employees') }}

{% if is_incremental() %}
WHERE employee_id NOT IN (SELECT employee_id FROM {{ this }})
{% endif %}