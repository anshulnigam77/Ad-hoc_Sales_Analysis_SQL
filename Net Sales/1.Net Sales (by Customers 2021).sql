SELECT
dc.customer, ROUND(SUM(net_sales)/1000000,2) as net_sales_mln
FROM net_sales ns
JOIN dim_customer dc ON ns.customer_code = dc.customer_code
WHERE fiscal_year = 2021
GROUP BY customer
ORDER BY net_sales_mln DESC LIMIT 5