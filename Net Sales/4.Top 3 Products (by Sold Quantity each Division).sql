with cte1 as (SELECT 
division, product, SUM(sold_quantity) as tsq
FROM fact_sales_monthly fs
JOIN dim_product dp ON fs.product_code = dp.product_code
WHERE fiscal_year = 2021
GROUP BY product,division),

cte2 as (SELECT *,
dense_rank() over(partition by division order by tsq desc) as rn
FROM cte1)

SELECT * FROM cte2 WHERE rn <= 3;
