with cte1 as (SELECT
dc.customer, ROUND(SUM(net_sales)/1000000,2) as net_sales_mln
FROM net_sales ns
JOIN dim_customer dc ON ns.customer_code = dc.customer_code
WHERE fiscal_year = 2021
GROUP BY customer
ORDER BY net_sales_mln DESC)

SELECT *,
net_sales_mln*100/SUM(net_sales_mln) over() as pct_share
FROM cte1