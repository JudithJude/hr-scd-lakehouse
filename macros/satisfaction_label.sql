{% macro satisfaction_label(column_name) %}
    CASE {{ column_name }}
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
        ELSE 'Unknown'
    END
{% endmacro %}