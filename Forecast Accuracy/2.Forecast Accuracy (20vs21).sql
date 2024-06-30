with cte1 as (SELECT s.customer_code,
SUM((forecast_quantity-sold_quantity)) as net_err,
SUM((forecast_quantity-sold_quantity)*100)/SUM(forecast_quantity) as net_err_pct,
SUM(abs(forecast_quantity-sold_quantity)) as abs_err,
SUM(abs(forecast_quantity-sold_quantity)*100)/SUM(forecast_quantity) as abs_err_pct
FROM fact_act_est s
WHERE s.fiscal_year = 2020
Group by s.customer_code)

SELECT ct.customer_code, cu.customer,cu.market, 
if(abs_err_pct>100,0,100-abs_err_pct) as forecast_accuracy_2020, forecast_accuracy_2021
from cte1 ct
JOIN forecast_accuracy21 USING(customer_code)
JOIN dim_customer cu USING(customer_code)
Order by market;



