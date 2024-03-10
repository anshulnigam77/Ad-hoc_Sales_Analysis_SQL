SELECT 
fs.date, fs.product_code, dp.product, dp.variant, fs.sold_quantity, gp.gross_price,
ROUND(fs.sold_quantity * gp.gross_price,2) as gross_price_total
FROM fact_sales_monthly fs
JOIN dim_product dp ON fs.product_code = dp.product_code
JOIN fact_gross_price gp ON fs.product_code = gp.product_code
						AND gp.fiscal_year = get_fy(fs.date)
WHERE customer_code = 90002002
AND get_fy(date) = 2021
# AND get_fq(date) = "Q3" 
ORDER BY date ;



