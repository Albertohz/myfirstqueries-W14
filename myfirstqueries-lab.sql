SELECT * FROM myfirstquery.applestore2;
SELECT * FROM myfirstquery.applestore2 LIMIT 10; 

-- 1. Which are the different genres?
SELECT DISTINCT (prime_genre) FROM myfirstquery.applestore2;  

-- 2. Which is the genre with more apps rated?
SELECT prime_genre FROM myfirstquery.applestore2
WHERE user_rating IS NOT NULL GROUP BY prime_genre 
ORDER BY COUNT(*) DESC LIMIT 1;

-- 3. Which is the genre with more apps?
SELECT prime_genre FROM myfirstquery.applestore2
GROUP BY prime_genre ORDER BY COUNT(*) DESC LIMIT 1;

-- 4. Which is the one with less?
SELECT prime_genre FROM myfirstquery.applestore2
GROUP BY prime_genre ORDER BY COUNT(*) ASC LIMIT 1;

-- 5. Take the 10 apps most rated.
SELECT * FROM myfirstquery.applestore2
WHERE user_rating IS NOT NULL ORDER BY rating_count_tot DESC LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT * FROM myfirstquery.applestore2
WHERE user_rating IS NOT NULL ORDER BY user_rating DESC LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
-- 4 out of top 10 most rated apps are games followed by social network and music (2 each). 
-- Very curious that the bible is top 7. 

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
-- 5 out of 10 apps are games. some of them have a very low total count (all except for 2 that have 2k or more). 
-- 6 of them are not for free. 

-- 9. Now compare the data from questions 5 and 6. What do you see?
-- I am not sure what is expected from this question.I would say that many of these apps (in quesiton 6) look fake and not well known to the public. 

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT * FROM myfirstquery.applestore2
WHERE user_rating IS NOT NULL ORDER BY (user_rating * rating_count_tot) DESC
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT price, COUNT(*) AS num_apps FROM myfirstquery.applestore2 GROUP BY price ORDER BY price;
-- free apps represent around 60% of the total apps in the database. 
-- for paid apps, the sweetpots seems to be between 0.99 to 2.99. Also interesting to see how apps at 4.99 sell better than at 3.99
