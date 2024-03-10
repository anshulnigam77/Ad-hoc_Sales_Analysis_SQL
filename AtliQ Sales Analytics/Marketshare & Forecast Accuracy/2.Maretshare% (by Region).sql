with cte1 as (SELECT
dc.customer,dc.region, SUM(net_sales)/1000000 as net_sales_mln
FROM net_sales ns
JOIN dim_customer dc ON ns.customer_code = dc.customer_code
WHERE fiscal_year = 2021 
GROUP BY customer, region)

SELECT *,
net_sales_mln*100/SUM(net_sales_mln) over(partition by region) as pct_share
FROM cte1
ORDER BY region, net_sales_mln DESC
