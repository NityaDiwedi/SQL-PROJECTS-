--q1 who is te most senior employee based on job title?

select * from employee
order by levels desc
limit 1






----Q2 which countries have the most Invoice ?

SELECT COUNT (*) AS c, billing_country 
from invoice 
group by billing_country 
order by c desc

-----q3 what are top 3 values of total invoice 

SELECT total from invoice
order by total desc 
limit 3

----q4 which city has the best customer ? we would like to through a promotional music festival in the city wri
-- write a query that return one city that has that has the highest sum of invoice totals.
---return both the city and sum of all invoice intotal

select sum (total) AS invoice_total, billing_city
from invoice  
group by billing_city 
order by invoice_total desc

--q5 who is the best customer the customer who has been spend the most money will be declared as a best customer
--write a query that return the person who has spend the most money 

SELECT customer.customer_id,customer.first_name, customer.last_name, sum(invoice.total) as total
FROM customer 
JOIN invoice on customer.customer_id = invoice.customer_id 
group by customer.customer_id
order by total desc
limit 1









