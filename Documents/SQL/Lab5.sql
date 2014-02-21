--Ryan Bertsche
--02/21/2014
--Lab 5

--Question 1
select a.city
from agents a, orders o, customers c
where a.aid = o.aid and c.cid = o.cid
	and c.name = 'Basics'

--Question 2
select distinct o1.pid
from orders o
inner join customers c on o.cid = c.cid and c.city ='Kyoto'
inner join orders o1 on o.aid = o1.aid

--Question 3
SELECT cid, name
FROM customers
WHERE customers.cid IN(SELECT cid
	               FROM customers
	               WHERE customers.cid NOT IN(SELECT cid
			                          FROM orders
			                          
			                         )
	              );

--Question 4
select c.name 
from customers c
left outer join orders o on c.cid = o.cid
where o.ordno is null

--Question 5
select distinct c.name as "Customer's Name", a.name as "Agent's Name"
from customers c
inner join orders o on o.cid = c.cid
inner join agents a on c.city = a.city

--Question 6
select distinct a.name as "Agent Name", c.name as "Customer Name", a.city
from customers c
Inner Join agents a on c.city = a.city

--Question 7
select c.name as "Customer Name", c.city
from customers c
where c.city in( 
	select p.city
	from products p
	group by p.city
	order by count(p.city) asc
	limit 1);

