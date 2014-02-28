--Ryan Bertsche
--02/28/2014
--Lab 6
--Question 1 && 2
select c.name, c.city
from customers c
where c.city in(select p.city
from products p
group by p.city 
order by sum(p.quantity) desc
limit 3

)

--Question 3
select * 
from products p
where p.priceusd > (
select avg(p1.priceusd)
from products p1)

--Question 4
select c.name, o.pid, o.dollars, o.ordno
from customers c
inner join orders o on c.cid = o.cid
order by o.dollars desc

--Question 5
select c.name, sum(o.dollars) as total
from customers c
inner join orders o on c.cid = o.cid
group by c.name
order by total desc

--Question 6
select c.name as "Customer Name", p.name, a.name, a.city
from agents a
inner join orders o on o.aid = a.aid
inner join customers c on c.cid=o.cid
inner join products p on p.pid = o.pid
where a.city = 'New York'	

--Question 7
select o.ordno, o.dollars, ((o.qty * p.priceusd) - ((o.qty * p.priceusd)*(c.discount /100))) as true_price
from orders o 
inner join products p on o.pid = p.pid
inner join customers c on c.cid = o.cid



