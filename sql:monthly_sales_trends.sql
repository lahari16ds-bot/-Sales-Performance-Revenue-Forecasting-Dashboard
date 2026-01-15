-- Monthly revenue trends

SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(sale_amount) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;
