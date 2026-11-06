###Total Rows#
SELECT COUNT(*) AS total_users FROM users;

SELECT COUNT(*) AS total_cards FROM cards;

SELECT COUNT(*) AS total_transactions FROM transactions;


##Total Credit Cards
SELECT COUNT(*) FROM cards WHERE card_type = 'Credit';

##Total Transactions
SELECT COUNT(*) FROM  transactions;

# ACTIVE CUSTOMERS 
SELECT  COUNT(DISTINCT client_id) FROM  transactions;

#Card Type Distribution
SELECT  card_type,count(*) FROM cards GROUP BY card_type ;

# Card Brand Distribution 
SELECT COUNT(*),card_brand FROM cards GROUP BY  card_brand;

# Transaction Date Range
SELECT MIN(transaction_date), MAX(transaction_date) FROM transactions;


#customerswithcardsbutnotransactions
SELECT COUNT(DISTINCT client_id) AS TotalCustomers FROM  cards WHERE client_id NOT IN ( SELECT client_id FROM transactions);


# Customers Without Transactions
SELECT COUNT( DISTINCT  s.id) FROM  users S left join transactions t on t.client_id = S.id WHERE t.id IS NULL;

# customers without cards
SELECT  COUNT(*) FROM  users  WHERE id not in ( select  (client_id) from cards);

# Customers With Multiple Cards
WITH CUSTOMERS AS (SELECT  client_id, COUNT(card_type) FROM cards GROUP BY client_id HAVING COUNT(card_type) > 1)
SELECT COUNT(client_id) FROM CUSTOMERS;

#averagecreditlimit
SELECT round(AVG(credit_limit),2) FROM cards;

#totalcreditlimit
SELECT SUM(credit_limit) FROM cards;

#cardswithchiptechnology
SELECT COUNT(*) FROM cards WHERE has_chip = 'Yes';

# Cards Reported on Dark Web
SELECT COUNT(*) FROM cards WHERE card_on_dark_web = 'Yes';

#cardbrandwithhighestaveragecreditlimit
with brandranking AS ( SELECT card_brand, AVG(credit_limit), DENSE_RANK() OVER( ORDER BY AVG(credit_limit) DESC) AS RANKING FROM cards GROUP BY card_brand)
SELECT card_brand FROM brandranking WHERE RANKING = 1;

#topcardbrandbytotalcreditlimit
with brandranking AS ( SELECT card_brand, SUM(credit_limit), DENSE_RANK() OVER( ORDER BY SUM(credit_limit) DESC) AS RANKING FROM cards GROUP BY card_brand)
SELECT card_brand FROM brandranking WHERE RANKING = 1;

#cardexpirybyyear
SELECT YEAR(expires) AS YEAR,COUNT(*) FROM cards GROUP BY YEAR(expires)

#cardsexpiringinthenexttwoyears
SELECT COUNT(*) FROM cards WHERE expires BETWEEN CURDATE() AND DATE_ADD(CURDATE(),INTERVAL 2 YEAR)

#transactionsbypaymentmethod
SELECT use_chip,COUNT(*) FROM transactions GROUP BY use_chip;

#monthlytransactionvolume
SELECT MONTH(transaction_date),COUNT(*) FROM transactions GROUP BY  MONTH(transaction_date);

#monthlytransactionvalue
SELECT MONTH(transaction_date),SUM(amount) FROM transactions GROUP BY  MONTH(transaction_date);

#top10customersbytotalspending
 with ranking as (SELECT client_id,SUM(amount),DENSE_RANK() OVER(ORDER BY SUM(amount) DESC) AS RANKING FROM transactions GROUP BY client_id
 ) SELECT client_id FROM ranking WHERE RANKING <= 10;

#customersspendingaboveaverage
SELECT client_id,SUM(amount) FROM transactions GROUP BY  client_id HAVING SUM(amount) > (SELECT AVG(totalamount)  FROM (SELECT SUM(amount) AS totalamount,client_id  FROM  transactions GROUP BY client_id)t)

#mostfrequentlyusedpaymentmethodpercustomer
WITH RANKINGCARDS AS (SELECT C.client_id,C.card_brand,U.gender,COUNT(T.card_id),ROW_NUMBER() OVER( ORDER BY COUNT(T.card_id) DESC) AS RANKING
FROM cards C INNER JOIN transactions T ON T.client_id = C.client_id INNER JOIN users U on U.id = T.id GROUP BY  C.client_id,C.card_brand,U.gender)
 SELECT card_brand FROM RANKINGCARDS WHERE RANKING =1;

#customersusingmultiplepaymentmethods
WITH customersusingmultiplepaymentmethods AS (SELECT client_id,COUNT(use_chip) FROM transactions GROUP BY client_id HAVING COUNT( DISTINCT use_chip) >1)
SELECT COUNT(client_id) FROM customersusingmultiplepaymentmethods;

#merchanttransactioncontributionbystate
merchant_state,SUM(amount),DENSE_RANK() OVER(ORDER BY SUM(amount) DESC) AS RANKING FROM transactions group by merchant_state;

#customermerchantloyaltyanalysis
WITH CUSTOMERRANKING AS (SELECT U.id,COUNT( DISTINCT T.mcc) AS distinct_merchant_categories,DENSE_RANK() OVER(ORDER BY COUNT( DISTINCT T.mcc) DESC) AS RANKING FROM users U INNER JOIN transactions T ON T.client_id = U.id GROUP BY U.id)
SELECT id FROM CUSTOMERRANKING WHERE RANKING <= 3;















