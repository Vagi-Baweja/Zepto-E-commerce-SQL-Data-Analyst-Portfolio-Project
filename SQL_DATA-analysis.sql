DROP  table if exists zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discounntedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

SELECT  COUNT(*) FROM zepto;

SELECT * FROM zepto
LIMIT 10;

SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR 
mrp IS NULL
OR 
discountPercent IS NULL
OR 
availableQuantity IS NULL
OR 
discounntedSellingPrice IS NULL
OR 
weightInGms IS NULL
OR
outOfStock IS NULL
OR 
quantity IS NULL;

--differnet product category

SELECT DISTINCT category
FROM zepto
ORDER BY category;

--product is stock vs out of stock

SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present multiple times

SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

--data cleaning

--product with price =0
SELECT * FROM zepto
WHERE mrp = 0 OR discounntedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--convert paise to ruppes
UPDATE zepto
SET mrp = mrp/100.0,
discounntedSellingPrice = discounntedSellingPrice/100.0;

SELECT mrp,discounntedSellingPrice FROM zepto;

--Find the top 10 best-value products based on the discount perentage.

SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- What are the Products with Hight MRP but Out Of Stock

SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE AND mrp >300
ORDER BY mrp DESC;

-- Calculate Estimated Revenue for each category

SELECT category, 
SUM(discounntedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Find all products where MRP is greater than 500 and discount is less than 10%

SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

--Identify the top 5 categroies offering highest average docount

SELECT category, ROUND(AVG(discountPercent) ,2) as avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Find the price per gram for products above 100 gram and sort by best value

SELECT DISTINCT name, weightInGms, discounntedSellingPrice,
ROUND(discounntedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ;

-- Group the products into categroies like Low,Bulk,Medium

SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
     WHEN weightInGms < 5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;

--What is the total Inventory weight per categroy

SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

