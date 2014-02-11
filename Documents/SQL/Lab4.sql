--Ryan Bertsche
--Lab 4
--02/14/2014
--Question 1
SELECT agents.city
FROM agents
WHERE agents.aid IN(SELECT aid
		    FROM orders
		    WHERE orders.cid IN(SELECT cid
			                FROM customers
			                WHERE name = 'Basics'
			               )
		   );

--Question 2
SELECT distinct pid
FROM orders
WHERE aid IN(SELECT aid
	     FROM orders
	      WHERE cid IN(SELECT cid
			   FROM customers
			   WHERE city = 'Kyoto'
			  )
	    )
ORDER BY pid ASC;

--Question 3
SELECT cid, name
FROM customers
WHERE customers.cid IN(SELECT cid
	               FROM customers
	               WHERE customers.cid NOT IN(SELECT cid
			                          FROM orders
			                          WHERE aid = 'a03'
			                         )
	              );

--Question 4	              
SELECT cid, name
FROM customers
WHERE customers.cid IN(SELECT cid
	               FROM orders
	               WHERE cid IN(SELECT cid
			            FROM orders
			            WHERE pid = 'p01'
			           )
		          AND pid = 'p07'
	              );

--Question 5
SELECT distinct pid
FROM orders
WHERE cid IN(SELECT cid
	     FROM orders
	     WHERE ordno IN(SELECT ordno
			    FROM orders
			    WHERE aid = 'a03'
			   )
	    )
ORDER BY pid ASC;

--Question 6
SELECT name, discount
FROM customers
WHERE cid IN(SELECT cid
	     FROM orders
	     WHERE aid IN(SELECT aid
			  FROM agents
			  WHERE city IN('Dallas', 'Duluth')
			 )
	    );

--Question 7
SELECT *
FROM customers
WHERE discount IN(SELECT discount
	          FROM customers
	          WHERE cid IN(SELECT cid		
			       FROM customers
			       WHERE city IN ('Dallas', 'Kyoto')
			      )
			      
	         );



