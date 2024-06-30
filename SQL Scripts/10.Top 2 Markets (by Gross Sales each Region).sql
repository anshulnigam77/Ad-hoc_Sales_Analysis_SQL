with cte1 as (SELECT 
dc.market, dc.region, ROUND(SUM(gross_price_total/1000000),2) as gross_sales_mln
FROM sales_gross_price gs
JOIN dim_customer dc ON gs.customer_code = dc.customer_code
WHERE fiscal_year = 2021
GROUP BY dc.market, dc.region),
cte2 as (SELECT *,
dense_rank() over(partition by region order by gross_sales_mln desc) as rnk
from cte1)
SELECT * from cte2 WHERE rnk <=2;