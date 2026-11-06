SELECT COUNT(*) FROM USERS UNION  ALL SELECT COUNT(*) FROM transactions UNION ALL SELECT COUNT(*) FROM cards;

SELECT client_id,COUNT(*) FROM  cards  GROUP BY  client_id HAVING COUNT(*) > 1;

SELECT id,COUNT(*) FROM  cards  GROUP BY id HAVING COUNT(*) > 1;

SELECT client_id,COUNT(*) FROM transactions GROUP BY  client_id HAVING COUNT(*) > 1;

SELECT id,COUNT(*) FROM transactions GROUP BY  id HAVING COUNT(*) > 1;

SELECT COUNT( DISTINCT U.id)  FROM users U left join cards c on c.client_id  = u.id WHERE c.id IS NULL;

SELECT COUNT(C.client_id)  FROM users U left join cards c on c.id  = u.id WHERE c.client_id IS NULL;

SELECT COUNT(T.id) FROM users u LEFT JOIN transactions t on t.id = u.id WHERE T.id IS NULL;

SELECT COUNT(T.client_id) FROM users U left join transactions T on T.client_id = U.id WHERE T.client_id IS NULL;

SELECT COUNT(DISTINCT u.id) FROM users  U LEFT JOIN transactions t ON t.client_id = u.id WHERE t.id IS NULL;

SELECT COUNT(DISTINCT id) FROM users WHERE id NOT IN ( SELECT client_id  from cards);

SELECT COUNT(DISTINCT id) FROM users WHERE id NOT IN ( SELECT client_id  from cards);

SELECT COUNT(DISTINCT transaction_id) FROM transactions WHERE card_id NOT IN ( SELECT card_id FROM cards);

SELECT COUNT(DISTINCT transaction_id) FROM transactions;

SELECT COUNT(DISTINCT customer_id) FROM users;

SELECT COUNT(DISTINCT card_id) FROM cards;

SELECT COUNT(customer_id) FROM (SELECT  U.customer_id,COUNT(T.transaction_id) FROM users U INNER JOIN transactions T ON U.customer_id = T.customer_id GROUP BY U.customer_id)T; 

SELECT COUNT(DISTINCT customer_id) FROM users WHERE customer_id NOT IN ( SELECT customer_id FROM transactions); 

SELECT SUM(amount) FROM transactions;

SELECT ROUND(avg(amount),2) FROM transactions;

SELECT MIN(amount),MAX(amount) FROM transactions;

SELECT card_brand,COUNT(*) FROM crads GROUP BY  card_brand;

SELECT  card_type, SUM(credit_limit) FROM cards GROUP  BY  card_type;

SELECT DISTINCT card_type FROM cards;

SELECT  card_brand, AVG(credit_limit) FROM cards GROUP  BY  card_brand;
























