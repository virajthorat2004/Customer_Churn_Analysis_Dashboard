-- Create clean table

CREATE TABLE churn_clean AS
SELECT
CustomerId,
CreditScore,
Geography,
Gender,
Age,
Tenure,
Balance,
NumOfProducts,
HasCrCard,
IsActiveMember,
EstimatedSalary,
Exited
FROM churn_raw;
