SELECT
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