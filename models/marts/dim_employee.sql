SELECT
    {{ dbt_utils.generate_surrogate_key(['employee_id']) }} AS employee_sk,
    employee_id,
    Age,
    Gender,
    MaritalStatus,
    Department,
    JobRole,
    JobLevel,
    Education,
    EducationField,
    BusinessTravel,
    OverTime,
    Attrition
FROM {{ ref('stg_employees') }}