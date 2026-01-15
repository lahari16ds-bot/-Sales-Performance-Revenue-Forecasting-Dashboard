-- Sales performance by rep, region and product

SELECT
    s.sale_date,
    r.rep_name,
    r.region,
    p.product_name,
    SUM(s.sale_amount) AS total_revenue,
    COUNT(s.sale_id) AS total_deals
FROM sales s
JOIN sales_reps r
    ON s.rep_id = r.rep_id
JOIN products p
    ON s.product_id = p.product_id
GROUP BY
    s.sale_date,
    r.rep_name,
    r.region,
    p.product_name
ORDER BY
    total_revenue DESC;
