/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 10

*******************************************************************************
*******************************************************************************


In the exercises below you will need to use the clauses you used in the
previous SQL Challenges, plus the following clauses:
    - CASE
*/

/*******************************************************************************
CASE

https://www.w3schools.com/sql/sql_case.asp
*******************************************************************************/

/* 1. Select everything from the sales table and create a new column called 
   "sales_category" with case conditions to categorise qty:
   
		qty >= 50 high sales
		20 <= qty < 50 medium sales
		qty < 20 low sales
*/
select *,
Case
When qty < 20 Then 'Low sales'
When qty >= 20 and qty < 50 then 'Medium sales'
Else 'High sales'
End as 'Sales Category'
From sales;

/* 2. Given your three sales categories (high, medium, and low), 
   calculate the total number of books sold in each category. 
*/
select sum(qty),
Case
When qty < 20 Then 'Low sales'
When qty >= 20 and qty < 50 then 'Medium sales'
Else 'High sales'
End as 'Sales_Category'
From sales
Group by sales_category;


/* 3. Adding to your answer from the previous questions: output only those 
   sales categories that have a SUM(qty) greater than 100, and order them in 
   descending order */
select
Case
When qty < 20 Then 'Low sales'
When qty between 20 and 50 then 'Medium sales'
Else 'High sales'
End as 'Sales_Category',
sum(qty)
From sales
Group by sales_category
Having sum(qty) > 100;

/* 4. Find out the average book price, per publisher, for the following book 
    types and price categories:
		book types: business, traditional cook and psychology
		price categories: <= 5 super low, <= 10 low, <= 15 medium, > 15 high
        
    - When displaying the average prices, use ROUND() to hide decimals. */
Select Round(Avg(price)), pub_id,
Case
when price <= 5 then 'superlow'
When price >5 and price <= 10 then 'Low'
when price >10 and price <= 15 then 'Medium'
Else 'High'
end as Price_category
from titles
Where type in ('business', 'trad_cook' and 'psychology')
group by price_category, pub_id