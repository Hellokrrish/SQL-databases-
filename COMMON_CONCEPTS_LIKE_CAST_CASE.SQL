# 1. Calculate the overall number of boundaries scored by each batsman in the tournament
number of boundaries = fours + sixes
Note: Output must contain rows in the descending order ofnumber_of_boundaries and name.


SELECT
  name,
  SUM(fours + sixes) AS number_of_boundaries
FROM
  player
GROUP BY
  name
ORDER BY
  number_of_boundaries DESC,
  name DESC;



# 2. Get the highest score of each player who played in the year 2006.
Note: Output must contain rows in the descending order ofhighest_score.



SELECT
  name,
  MAX(score) AS highest_score
FROM
  player
WHERE
  CAST(strftime('%Y', match_date) AS INTEGER) = 2006
GROUP BY
  name
ORDER BY
  highest_score DESC;


# 3.Calculate the strike rate of all the players in every match.
strike_rate = (score of the player / no_of_balls)*100
Note: Strike rate in the output should be a float value.
In SQL, when an integer is divided by another integer, it results in another integer value, i.e, 3/2 = 1 which is an integer instead of 1.5 which is of float type. So we need to convert either the numerator or denominator to float to get more accurate results, i.e 3.0/2 or 3/2.0, to get 1.5 as output.
Let's apply the same while calculating the strike_rate to get accurate results.



SELECT
  name,
  MATCH,
  (CAST(score AS FLOAT) / no_of_balls * 100) AS strike_rate
FROM
  player
ORDER BY
  strike_rate DESC;


# 4.Let's generate a performance report for all the players who played in the year 2006.

Apply the below logic to grade the player's performance.

total score	performance report
>= 150	GOOD
100<=	AVERAGE
<100	BELOW AVERAGE
Note: Output must be in the descending order of total_score


SELECT
  name,
  sum(score) AS total_score,
  CASE
    WHEN sum(score) >= 150 THEN "GOOD"
    WHEN sum(score) BETWEEN 100
    AND 149 THEN "AVERAGE"
    ELSE "BELOW AVERAGE"
  END AS badge
FROM
  player
WHERE
  cast(strftime("%Y", match_date) AS integer) = 2006
GROUP BY
  name
ORDER BY
  total_score DESC;



# 5.For each player, get the number of matches in which their strike rate is less than 80.0, and the number of matches with strike rate greater than or equal to 80.0.
strike_rate = (score of the player / no_of_balls)*100
Note:
Strike rate should always be a float value.
Output must be in the ascending order of name


SELECT
  name,
  COUNT (
    CASE
      WHEN (CAST(score AS FLOAT) / no_of_balls) * 100 < 80.0 THEN 1
      ELSE NULL
    END
  ) AS strike_rate_less_than_80,
  COUNT (
    CASE
      WHEN (CAST(score AS FLOAT) / no_of_balls) * 100 >= 80.0 THEN 1
      ELSE NULL
    END
  ) AS strike_rate_greater_than_or_equal_to_80
FROM
  player
GROUP BY
  name
ORDER BY
  name;


# 6. Get all the player/s who played for both CSK and RCB.
Note: Output must be in the ascending order of name


SELECT
  name
FROM
  player
WHERE
  played_for_team LIKE "CSK"
INTERSECT
SELECT
  name
FROM
  player
WHERE
  played_for_team LIKE "RCB"
GROUP BY
  name
ORDER BY
  name ASC;


# 7. Get all the player/s who played only for SRH
Note: 
Names in the output must be in capital letters.
Output must be in the ascending order of name


SELECT
  UPPER(name) AS name
FROM
  player
WHERE
  played_for_team = "SRH"
EXCEPT
SELECT
  UPPER(name)
FROM
  player
WHERE
  played_for_team <> "SRH"
ORDER BY
  name ASC;


# 8. Get all the player/s who played either for SRH, CSK, or MI.
Note: 
Get unique players.
Output must be in the ascending order of name



SELECT
  DISTINCT name
FROM
  player
WHERE
  played_for_team = "SRH"
UNION
SELECT
  DISTINCT name
FROM
  player
WHERE
  played_for_team = "CSK"
UNION
SELECT
  DISTINCT name
FROM
  player
WHERE
  played_for_team = "MI"
GROUP BY
  name
ORDER BY
  name ASC;   



# 9. Fetch the name, highest and lowest scores of player/s 
for the matches in which strike rate is greater than 50.0.



SELECT
  name,
  MAX(score) AS highest_score,
  MIN(score) AS lowest_score
FROM
  player
WHERE
  (CAST(score AS FLOAT) / no_of_balls) * 100 > 50
GROUP BY
  name;

