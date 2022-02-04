---question 2

--Top 25
SELECT email_domain,
COUNT(*)
FROM users 
GROUP BY email_domain
ORDER BY COUNT(*) DESC
limit 25;

--number of edu users located in Y
SELECT email_domain,
city,
COUNT(*) total
FROM users
WHERE city = 'New York' AND email_domain LIKE '%edu%'
GROUP BY city;

--number of mobile-users
SELECT mobile_app,
COUNT(*) total
FROM users
WHERE mobile_app iS NOT NULL;


----question 3
--sign up counts per hour
SELECT sign_up_at,
   strftime('%H', sign_up_at) hours,
COUNT(*) 'Number of signees'
FROM users
GROUP BY 2;

--quesiton 4
--JOIN two tables together
-- Do different schools (.edu domains) prefer different courses?
--YES
-- What courses are the New Yorkers students taking?
--sql, cpp, html
-- What courses are the Chicago students taking?
--cpp
SELECT users.city, users.email_domain, progress.learn_sql, progress.learn_cpp, progress.learn_html, progress.learn_java
FROM users 
JOIN progress 
ON users.user_id = progress.user_Id
WHERE users.city = 'New York' OR users.city = 'Chicago'
GROUP BY users.city
LIMIT 200;