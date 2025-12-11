-- REPEAT PURCHASES BY CARD --
SELECT card, COUNT(card) AS no_of_times_purchased
FROM coffeesales
GROUP BY card
HAVING card <> '' 
ORDER BY COUNT(card) DESC;

-- Top 10 Customers (Card Users)

SELECT card, ROUND(SUM(money), 1) AS RevFrmCus,CONCAT(ROUND((SUM(money)/ (Select Sum(money) From coffeesales))*100, 1), "%") AS contribution_to_totalrev, COUNT(card) AS TimesBought
FROM coffeesales
WHERE card 	IS NOT NULL AND card <> ''
GROUP BY card
ORDER BY RevFrmCus DESC 
LIMIT 10 ;
