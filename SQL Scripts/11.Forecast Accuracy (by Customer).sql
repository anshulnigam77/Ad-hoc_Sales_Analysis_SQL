with cte1 as (SELECT s.customer_code,
SUM((forecast_quantity-sold_quantity)) as net_err,
SUM((forecast_quantity-sold_quantity)*100)/SUM(forecast_quantity) as net_err_pct,
SUM(abs(forecast_quantity-sold_quantity)) as abs_err,
SUM(abs(forecast_quantity-sold_quantity)*100)/SUM(forecast_quantity) as abs_err_pct
FROM fact_act_est s
WHERE s.fiscal_year = 2021
Group by s.customer_code)

SELECT cu.customer,cu.market, ct.*, 
if(abs_err_pct>100,0,100-abs_err_pct) as forecast_accuracy
from cte1 ct
JOIN dim_customer cu USING(customer_code)
Order by customer_code



