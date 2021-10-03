#1
SELECT product_name,quantity_per_unit 
FROM mynorthwind.products;

#2
SELECT product_name, product_id
FROM mynorthwind.products, mynorthwind.order_details
WHERE discontinued = 0
order by product_name;

#3
SELECT product_name, product_id
FROM mynorthwind.products, mynorthwind.order_details
WHERE discontinued = 1
Order by product_name;

#4
SELECT product_name, unit_price 
FROM mynorthwind.products, mynorthwind.order_details
Order by unit_price DESC;

#5
SELECT product_name, product_id, unit_price 
FROM mynorthwind.products, mynorthwind.order_details
WHERE (unit_price < 20 and discontinued=0)
Order by unit_price DESC;

#6
SELECT product_name, product_id, unit_price 
FROM mynorthwind.products, mynorthwind.order_details
WHERE (unit_price > 15 and unit_price < 25)
Order by unit_price DESC;

#7
SELECT DISTINCT product_name, unit_price 
FROM mynorthwind.products, mynorthwind.order_details
WHERE unit_price > (SELECT avg(unit_price) FROM mynorthwind.order_details)
Order by unit_price DESC;

#8
SELECT product_name, unit_price 
FROM mynorthwind.products
JOIN mynorthwind.order_details ON mynorthwind.products.id = mynorthwind.order_details.product_id
ORDER BY unit_price DESC LIMIT 10;


#9
SELECT discontinued,
COUNT(*) FROM mynorthwind.products
GROUP BY discontinued;


#10
SELECT * FROM mynorthwind.order_details;
SELECT * FROM mynorthwind.inventory_transactions; 
SELECT * FROM mynorthwind.products;
SELECT p.product_name as "name", sum(o.orderQuantity) as "units on order", sum(i.quantity) as "units in stock"
FROM mynorthwind.products as p
JOIN mynorthwind.order_details as o
on p.id = o.product_id
JOIN mynorthwind.inventory_transactions as i
on p.id = i.product_id
GROUP BY p.product_name
HAVING sum(o.orderQuantity) > sum(i.quantity);


