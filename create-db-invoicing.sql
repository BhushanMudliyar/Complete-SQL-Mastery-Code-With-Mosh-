SELECT 
first_name , 
last_name, 
points, 
(points + 10) *100 AS 'discount factor'
FROM customers

SELECT DISTINCT State
FROM customers

SELECT 
name,
unit_price,
(unit_price * 1.1) AS 'new price'
FROM products 

SELECT * 
FROM Customers
WHERE birth_date > '1990-01-01'

SELECT *
FROM  orders
WHERE order_date >= '2019-01-01'

SELECT * 
FROM Customers
WHERE birth_date > '1990-01-01' AND points >1000

SELECT * 
FROM Customers
WHERE birth_date > '1990-01-01' OR points >1000

SELECT * 
FROM Customers
WHERE birth_date > '1990-01-01' OR points >1000 AND
state = 'VA'

SELECT * 
FROM Customers
WHERE birth_date > '1990-01-01' OR 
(points >1000 AND state = 'VA')

SELECT *
FROM customers
WHERE birth_date > '1990-01-01' OR points > 1000

SELECT *
FROM customers
WHERE NOT (birth_date > '1990-01-01' OR points > 1000)

SELECT *
FROM customers
WHERE birth_date <= '1990-01-01' AND points <= 1000

SELECT *
FROM order_items
WHERE order_id = '6' AND unit_price*quantity > 30

SELECT * 
FROM customers
WHERE state = 'VA' OR State = 'GA' or State =  'FL'

-- OR
SELECT * 
FROM customers
WHERE state IN('GA','FL','VA') 


SELECT * 
FROM customers
WHERE state = 'VA' OR 'GA' OR 'FL' -- this line's query will not work

SELECT * 
FROM customers
WHERE state IN('GA','FL','VA') order by customer_id

SELECT * 
FROM customers
WHERE state NOT IN('GA','FL','VA') order by customer_id

SELECT *
FROM products
WHERE quantity_in_stock IN ('49', '38', '72')


SELECT *
FROM customers
WHERE points>=1000 AND points <=3000

-- or
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'

SELECT *
FROM customers
WHERE last_name LIKE 'b%' -- customers whose last name begins with b

SELECT *
FROM customers
WHERE last_name LIKE 'brush%' -- customers whose last name  begins with brush

SELECT *
FROM customers
WHERE last_name LIKE '%b%' -- customers whose having name b wether it is beginning or somewhere or at the end


SELECT *
FROM customers
WHERE last_name LIKE '%y' -- customers whose last name ends with y

SELECT *
FROM customers
WHERE last_name LIKE '_y' -- customers whose last name exactly 2 characters long and 2nd character is y

SELECT *
FROM customers
WHERE last_name LIKE '_____y'

SELECT *
FROM customers
WHERE last_name LIKE 'b____y'

-- % use to represent any number of characeter
-- _(underscore) use to represent single character

SELECT *
FROM customers
WHERE address LIKE '%trail%' OR  address LIKE '%avenue%'
 
SELECT *
FROM customers
WHERE phone LIKE '%9'

 
SELECT *
FROM customers
WHERE phone NOT LIKE '%9'

SELECT *
FROM customers
WHERE last_name LIKE '%field%'

-- or
SELECT *
FROM customers
WHERE last_name REGEXP 'field' -- no need to write signs as in LIKE 

SELECT *
FROM customers
WHERE last_name REGEXP '^field' -- use to find the string must begin with field

SELECT *
FROM customers
WHERE last_name REGEXP 'field$' -- use to find the string must end with field

SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac|rose' -- use to find the string have field ,mac or rose in the last name

SELECT *
FROM customers
WHERE last_name REGEXP '^field|mac|rose' 

SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|rose' 

SELECT *
FROM customers
WHERE last_name REGEXP '[gi]e' 

SELECT *
FROM customers
WHERE last_name REGEXP '[gi]e'

SELECT *
FROM customers
WHERE last_name REGEXP '[a-z]y'

SELECT *
FROM customers
WHERE last_name REGEXP '[a-z]y$'

-- ^ use to represent beginning of string
-- $ use to represent end of string 
-- | use to represent logical or
-- [abcd] to match any single  characeters list in the brackets
-- [a-z] to represent range  

SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur'

SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$'

SELECT *
FROM customers
WHERE last_name REGEXP '^my|se'

SELECT *
FROM customers
WHERE last_name REGEXP '^b[ru]'

SELECT *
FROM customers
WHERE last_name REGEXP 'br|bu'

SELECT *
FROM customers
WHERE phone IS NULL

SELECT *
FROM customers
WHERE phone IS NOT NULL


SELECT *
FROM orders
WHERE shipped_date IS NOT NULL

SELECT *
FROM customers
ORDER BY first_name

SELECT *
FROM customers
ORDER BY first_name DESC 

SELECT *
FROM customers
ORDER BY state, first_name

SELECT *
FROM customers
ORDER BY state DESC, first_name DESC

SELECT first_name ,last_name
FROM customers
ORDER BY birth_date

SELECT * , quantity*unit_price AS total_price 
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC


SELECT *
FROM customers
LIMIT 6,3

-- above query
-- page 1:1-3
-- page 2:4-6
-- page 3:7-9   

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3

SELECT *
FROM orders 
INNER JOIN customers  -- inner keyword is optional
ON orders.customer_id= customers.customer_id

SELECT order_id, first_name,last_name
FROM orders 
JOIN customers  
ON orders.customer_id= customers.customer_id

SELECT order_id, o.customer_id, first_name,last_name
FROM orders o
JOIN customers c  
ON o.customer_id= c.customer_id

SELECT *
FROM order_items oi
JOIN products p ON oi.product_id=p.product_id

SELECT order_id,oi.product_id, quantity, oi.unit_price
FROM order_items oi
JOIN products p ON oi.product_id=p.product_id

USE sql_inventory;
SELECT *
FROM sql_store.order_items oi
JOIN products p
ON oi.product_id=p.product_id;

USE sql_hr;
SELECT *
FROM employee e
JOIN employee m
ON e.reports_to=m.employee_id;

SELECT 
e.employee_id
e.first_name,
m.first_name AS manager
FROM employees e
JOIN employee m
ON e.reports_to=m.employee_id;


SELECT 
o.order_id,
o.order_date,
c.first_name,
c.last_name,
os.name AS status
FROM orders o 
JOIN customers c
ON o.customer_id=c.customer_id
JOIN order_statuses os 
ON o.status=os.order_status_id