SELECT 
get_fy(fs.date) as fiscal_year,
ROUND(SUM(gp.gross_price*fs.sold_quantity),2) as gross_price_total 
FROM fact_sales_monthly fs
JOIN fact_gross_price gp ON fs.product_code = gp.product_code
						AND gp.fiscal_year = get_fy(fs.date)
WHERE customer_code = 90002002
GROUP BY get_fy(fs.date)
ORDER BY fiscal_year;
