-- Sales rep performance vs quota

SELECT
    r.rep_name,
    r.region,
    q.quota_amount,
    SUM(s.sale_amount) AS actual_sales,
    ROUND((SUM(s.sale_amount) / q.quota_amount) * 100, 2) AS quota_attainment_pct
FROM sales s
JOIN sales_reps r
    ON s.rep_id = r.rep_id
JOIN quotas q
    ON r.rep_id = q.rep_id
GROUP BY
    r.rep_name, r.region, q.quota_amount
ORDER BY quota_attainment_pct DESC;
