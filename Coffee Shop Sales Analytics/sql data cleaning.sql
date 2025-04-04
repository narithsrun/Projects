CREATE DATABASE cofee_shop_sales_db
SELECT * FROM coffee_shop_sales


#Sales analysis by day and hours
SELECT
	SUM(unit_price * transaction_qty) AS total_sales,
    SUM(transaction_qty) AS total_qty_sold,
    COUNT(*) AS total_orders
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5 -- may
	AND DAYOFWEEK(transaction_date) = 1 -- MONDAY
    AND HOUR(transaction_time) = 14 -- hour NO 8



#Finding product total sales (USE LIMIT FUNCTION TO FIND TOP # of products
/*
SELECT
	product_category,
    SUM(unit_price * transaction_qty) AS Total_sales
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5
GROUP BY
	product_category
ORDER BY
	Total_sales DESC
LIMIT 10
*/


#Finding Daily sales
/*
SELECT
	DAY(transaction_date) AS day_of_month,
    SUM(unit_price * transaction_qty) AS total_sales
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5
GROUP BY
	(transaction_date)
ORDER BY
	DAY(transaction_date)
*/

#Finding AVGERAGE sales
/*
SELECT
	AVG(total_sales) AS Avg_sales
FROM
	(
    SELECT SUM(unit_price * transaction_qty) AS total_sales
    FROM
		coffee_shop_sales
	WHERE
		MONTH(transaction_date) = 5
	GROUP BY
		transaction_date
	) AS Internal_query
*/




#sales by store location
/*
SELECT
	store_location,
    SUM(unit_price * transaction_qty) AS Total_sales
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5
GROUP BY
	store_location
ORDER BY
	Total_sales DESC
*/




#Finding total sales, qty sold, and orders during specific dates
/*
SELECT
	SUM(unit_price * transaction_qty) AS Total_sales,
    SUM(transaction_qty) AS Total_qty_sold,
    COUNT(transaction_id) AS Total_orders
FROM
	coffee_shop_sales
WHERE
	transaction_date = '2023-05-18'
*/



# SALES During weekend vs weekdays
/*
SELECT
	CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekends'-- SAT and SUN
    ELSE 'Weekdays'
    END AS day_type,
    SUM(unit_price * transaction_qty) AS total_sales
FROM
    coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5
GROUP BY 
    CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekends'-- SAT and SUN
    ELSE 'Weekdays'
    END
  */  
    




















# Total quantity sold 
/*
SELECT SUM(transaction_qty) AS Total_Quantity_Sold
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date) = 6 # Month of June

SELECT
	MONTH(transaction_date) AS month,
    ROUND(SUM(transaction_qty)) AS total_quantity_sold,
    (SUM(transaction_qty) - LAG(SUM(transaction_qty), 1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty), 1)
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS month_increase_percentage
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) IN (4,5)
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date);
*/



# Total Orders comapred to last month
/*
SELECT
	MONTH(transaction_date) AS month, # Number of Month
    ROUND(COUNT(transaction_id)) AS total_orders, #Total orders Column
    (COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) # Month orders difference
    OVER (ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id), 1) # Divide by previous month orders
    OVER (ORDER BY MONTH(transaction_date )) * 100 AS month_increase_percentage #Convert to percentage
FROM 
	coffee_shop_sales
WHERE
	MONTH(transaction_date) IN (4,5) # Month of April and May
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date);
*/


# Total Sales compared to last month
/*
SELECT
	MONTH(transaction_date) AS month, # Number of Month
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales, #Total Sales Column
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) # Month sales difference
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1) # Divide by previous month sales
    OVER (ORDER BY MONTH(transaction_date )) * 100 AS month_increase_percentage #Convert to percentage
FROM 
	coffee_shop_sales
WHERE
	MONTH(transaction_date) IN (4,5) # Month of April and May
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date);
*/


#changing the data from text to dates
/*UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%d-%m-%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;
*/

#changing the data from text to time
/*UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE (transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;
*/

#renamed transaction_id and set it to an int
/*ALTER TABLE coffee_shop_sales
CHANGE COLUMN ï»¿transaction_id transaction_id INT;
*/

