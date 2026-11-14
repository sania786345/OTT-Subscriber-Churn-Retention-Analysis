create database ott_analysis;
use ott_analysis;

show tables;

USE ott_analysis;

SELECT *
FROM netflix_customer_churn_dataset
LIMIT 5;

SELECT COUNT(*) AS total_records
FROM netflix_customer_churn_dataset;



/*
Q . Business Question: Where are we losing the most customers?
    Purpose:
    Identify regions with the highest number
    of churned customers.
*/
SELECT
    subscription_type,
    COUNT(*) AS total_customers,
    SUM(CAST(churned AS UNSIGNED)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churned AS UNSIGNED)) / COUNT(*), 2
    ) AS churn_rate_pct
FROM netflix_customer_churn_dataset
GROUP BY subscription_type
ORDER BY churn_rate_pct DESC;

USE ott_analysis;

-- Business Question: Where are we losing the most customers?

SELECT
    region,
    COUNT(*) AS churned_customers
FROM netflix_customer_churn_dataset
WHERE churned = 1
GROUP BY region
ORDER BY churned_customers DESC;


-- Q2: Are customers disengaging before they churn?
-- Compare login inactivity with churn status.

SELECT
    last_login_days,
    COUNT(*) AS total_customers,
    SUM(CAST(churned AS UNSIGNED)) AS churned_customers
FROM netflix_customer_churn_dataset
GROUP BY last_login_days
ORDER BY last_login_days;


-- Q3: Monthly-fee exposure from churned customers

SELECT
    subscription_type,
    COUNT(*) AS churned_customers,
    SUM(monthly_fee) AS monthly_fee_exposure,
    AVG(monthly_fee) AS average_monthly_fee
FROM netflix_customer_churn_dataset
WHERE churned = 1
GROUP BY subscription_type
ORDER BY monthly_fee_exposure DESC;


-- Q4: Does the number of profiles relate to churn?

SELECT
    number_of_profiles,
    COUNT(*) AS total_customers,
    SUM(CAST(churned AS UNSIGNED)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churned AS UNSIGNED)) / COUNT(*), 2
    ) AS churn_rate
FROM netflix_customer_churn_dataset
GROUP BY number_of_profiles
ORDER BY number_of_profiles;


-- Q5: Check questionable daily watch-time values

SELECT
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN avg_watch_time_per_day > 24 THEN 1
            ELSE 0
        END
    ) AS records_above_24_hours
FROM netflix_customer_churn_dataset;


-- Q5: Inspect questionable records

SELECT
    customer_id,
    avg_watch_time_per_day,
    churned,
    subscription_type
FROM netflix_customer_churn_dataset
WHERE avg_watch_time_per_day > 24;


-- Compare overall churn rate before and after excluding questionable records

SELECT
    'All customers' AS data_group,
    COUNT(*) AS total_customers,
    ROUND(
        100.0 * SUM(CAST(churned AS UNSIGNED)) / COUNT(*), 2
    ) AS churn_rate
FROM netflix_customer_churn_dataset

UNION ALL

SELECT
    'Excluding questionable records',
    COUNT(*),
    ROUND(
        100.0 * SUM(CAST(churned AS UNSIGNED)) / COUNT(*), 2
    )
FROM netflix_customer_churn_dataset
WHERE avg_watch_time_per_day <= 24;


-- Q6: Does churn differ by payment method?

SELECT
    payment_method,
    COUNT(*) AS total_customers,
    SUM(CAST(churned AS UNSIGNED)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churned AS UNSIGNED)) / COUNT(*), 2
    ) AS churn_rate
FROM netflix_customer_churn_dataset
GROUP BY payment_method
ORDER BY churn_rate DESC;


-- Payment method and regional analysis

SELECT
    payment_method,
    GROUP_CONCAT(
        region ORDER BY region SEPARATOR ', '
    ) AS regions,
    SUM(total_customers) AS total_customers,
    SUM(churned_customers) AS churned_customers,
    ROUND(
        100.0 * SUM(churned_customers) / SUM(total_customers),
        2
    ) AS churn_rate
FROM (
    SELECT
        payment_method,
        region,
        COUNT(*) AS total_customers,
        SUM(CAST(churned AS UNSIGNED)) AS churned_customers
    FROM netflix_customer_churn_dataset
    GROUP BY payment_method, region
) AS regional_data
GROUP BY payment_method
ORDER BY payment_method;


-- Q7: Does churn differ by customers' favorite genre?

SELECT
    favorite_genre,
    COUNT(*) AS total_customers,
    SUM(CAST(churned AS UNSIGNED)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churned AS UNSIGNED)) / COUNT(*), 2
    ) AS churn_rate
FROM netflix_customer_churn_dataset
GROUP BY favorite_genre
ORDER BY churn_rate DESC;


-- Q8: Are some device-and-plan combinations associated with unusually high churn?

SELECT
    subscription_type,
    device,
    COUNT(*) AS total_customers,
    SUM(CAST(churned AS UNSIGNED)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churned AS UNSIGNED)) / COUNT(*), 2
    ) AS churn_rate
FROM netflix_customer_churn_dataset
GROUP BY subscription_type, device
ORDER BY churn_rate DESC;