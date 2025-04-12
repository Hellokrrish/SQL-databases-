# 1.Get the total score of each player.
Note: Output must contain rows in the descending order oftotal_score

SELECT
  name,
  SUM(score) AS total_score
FROM
  player_match_details
GROUP BY
  name
ORDER BY
  total_score DESC;



# 2.Get the number of half centuries scored by each player.
Note: Output must contain rows in the descending order ofhalf_centuries


SELECT
  name,
  COUNT(*) AS half_centuries
FROM
  player_match_details
WHERE
  score >= 50
GROUP BY
  name
ORDER BY
  half_centuries DESC;




# 3.Get the total number of 4's hit by each player asno_of_fours.
Note: Output must contain rows in the descending order ofno_of_fours



SELECT
  name,
  SUM(fours) AS no_of_fours
FROM
  player_match_details
GROUP BY
  name
ORDER BY
  no_of_fours DESC;


# 4.Get the highest score of every player asmax_score.
Note: Output must contain rows in the descending order ofmax_scoreof the player.



SELECT
  name,
  MAX(score) AS max_score
FROM
  player_match_details
GROUP BY
  name
ORDER BY
  max_score DESC;





# 5.Get playernameand the total number of matches played asno_of_matchesby each player in the year 2012.
Note: Output must contain rows in the descending order ofno_of_matchesof each player.



SELECT
  name,
  COUNT(MATCH) AS no_of_matches
FROM
  player_match_details
WHERE
  year = "2012"
GROUP BY
  name
ORDER BY
  no_of_matches DESC;



# 6. Get the year-wise performance, i.e., no_of_matchesand runs_scoredby each player.
Note: Output must contain rows in the ascending order ofname&year



SELECT
  name,
  year,
  COUNT(MATCH) AS no_of_matches,
  SUM(score) AS runs_scored
FROM
  player_match_details
GROUP BY
  name,
  year
ORDER BY
  name,
  year ASC;



# 7. Get the details of all players whose average score is greater than 50 , along with the number of sixes they have scored.
Note: Output must contain rows in the ascending order ofnameof the player.




SELECT
  name,
  AVG(score) AS avg_score,
  SUM(sixes) AS total_sixes
FROM
  player_match_details
GROUP BY
  name
HAVING
  score > 50
ORDER BY
  name ASC;




# 8. Get the player wise total number of matches where the players scored more than 50 and in at least 2 matches.
Note: Output must contain rows in the ascending order ofnameof the player.


SELECT
  name,
  COUNT(MATCH) AS no_of_matches
FROM
  player_match_details
WHERE
  score > 50
GROUP BY
  name
HAVING
  no_of_matches >= 2
ORDER BY
  name ASC;

  