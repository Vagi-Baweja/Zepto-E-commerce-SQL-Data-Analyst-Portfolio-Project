# Zepto-E-commerce-SQL-Data-Analyst-Portfolio-Project
This is a complete, real-world data analyst portfolio project based on an e-commerce inventory dataset scraped from Zepto — one of India’s fastest-growing quick-commerce startups. This project simulates real analyst workflows, from raw data exploration to business-focused data analysis.

The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

🧾 Columns:

sku_id: Unique identifier for each product entry (Synthetic Primary Key)

name: Product name as it appears on the app

category: Product category like Fruits, Snacks, Beverages, etc.

mrp: Maximum Retail Price (originally in paise, converted to ₹)

discountPercent: Discount applied on MRP

discountedSellingPrice: Final price after discount (also converted to ₹)

availableQuantity: Units available in inventory

weightInGms: Product weight in grams

outOfStock: Boolean flag indicating stock availability

quantity: Number of units per package (mixed with grams for loose produce)

Tools Used
PostgreSQL
SQL
pgAdmin
GitHub

Dataset Features
Product Name
Category
MRP
Discount %
Quantity
Weight
Stock Status

Key SQL Concepts Used
CASE WHEN
GROUP BY
HAVING
Aggregate Functions
ORDER BY
Data Cleaning
Filtering
Sorting

Business Questions Solved
Which products have highest discounts?
Which categories generate highest revenue?
Which expensive products are out of stock?
What are the best value-for-money products?
Inventory weight analysis for warehouse planning

Key Insights
Fruits & Vegetables had the highest average discount.
Cooking Essentials generated high inventory weight.
Some high-MRP products were out of stock.
Duplicate SKUs existed for several products.

