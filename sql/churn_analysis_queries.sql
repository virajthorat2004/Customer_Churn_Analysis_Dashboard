/* -----------------------------------------------------
   Create Analytical View
   -----------------------------------------------------
   This view adds customer segmentation columns used
   in Power BI analysis such as:

   - Age groups
   - Balance groups
   - Credit score segments
   - Activity status
   - Churn status
------------------------------------------------------ */

CREATE VIEW churn_analysis_view AS
SELECT
    CustomerId,
    Geography,
    Gender,
    Age,
    Tenure,
    Balance,
    NumOfProducts,
    HasCrCard,
    IsActiveMember,
    EstimatedSalary,
    Exited,


    /* ---------------------------
       Customer Age Segmentation
       --------------------------- */
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS AgeGroup,


    /* ---------------------------
       Balance Segmentation
       --------------------------- */
    CASE
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance < 100000 THEN 'Low Balance'
        ELSE 'High Balance'
    END AS BalanceGroup,


    /* ---------------------------
       Credit Score Segmentation
       --------------------------- */
    CASE
        WHEN CreditScore < 500 THEN 'Poor'
        WHEN CreditScore BETWEEN 500 AND 700 THEN 'Average'
        ELSE 'Excellent'
    END AS CreditScoreGroup,


    /* ---------------------------
       Customer Activity Status
       --------------------------- */
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS ActivityStatus,


    /* ---------------------------
       Customer Churn Label
       --------------------------- */
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS ChurnStatus


FROM churn_clean;
