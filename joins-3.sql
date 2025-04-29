SELECT
  user.name,
  user.age,
  post.post_id,
  post.content,
  post.posted_at
FROM
  post
  INNER JOIN user ON user.user_id = post.posted_by
ORDER BY
  post.posted_at DESC;



SELECT
  user.name,
  user.age,
  post.post_id,
  post.content,
  post.posted_at
FROM
  post
  INNER JOIN user ON user.user_id = post.posted_by
WHERE
  user.name = "James Williams"
ORDER BY
  post.posted_at DESC
LIMIT
  5;




SELECT
  count() AS posts_count
FROM
  post
  INNER JOIN user ON user.user_id = post.posted_by
WHERE
  user.name = "James Williams";



SELECT
  user.user_id,
  user.name AS user_name,
  user.age,
  user.gender,
  count(post.posted_by) AS posts_count
FROM
  post
  INNER JOIN user ON user.user_id = post.posted_by
GROUP BY
  user.user_id,
  user.name,
  user.age,
  user.gender
HAVING
  count(post.posted_by) >= 2
ORDER BY
  posts_count DESC,
  user.user_id ASC;




SELECT
  user.user_id,
  user.name AS user_name,
  count(post.posted_by) AS posts_count
FROM
  (
    post
    INNER JOIN user ON user.user_id = post.posted_by
  )
WHERE
  cast(strftime("%Y", post.posted_at) AS int) = 2021
GROUP BY
  user.user_id,
  user.name
HAVING
  count(post.posted_by) >= 2
ORDER BY
  posts_count DESC,
  user.user_id ASC;



SELECT
  post.post_id,
  post.content,
  post.posted_by,
  count(
    CASE
      WHEN reaction.reaction_type IN("LIKE", "LIT", "WOW", "LOVE") THEN 1
      ELSE NULL
    END
  ) AS positive_reactions_count
FROM
  post
  LEFT JOIN reaction ON post.post_id = reaction.post_id
GROUP BY
  post.post_id
ORDER BY
  positive_reactions_count DESC,
  post.post_id ASC;





SELECT
  post.post_id,
  post.content,
  count(
    CASE
      WHEN reaction.reaction_type IN("LIKE", "LIT", "WOW", "LOVE") THEN 1
      ELSE NULL
    END
  ) AS positive_reactions_count,
  count(
    CASE
      WHEN reaction.reaction_type = "DISLIKE" THEN 1
      ELSE NULL
    END
  ) AS negative_reactions_count
FROM
  post
  LEFT JOIN reaction ON post.post_id = reaction.post_id
GROUP BY
  post.post_id
ORDER BY
  post.post_id ASC;




SELECT
  post.post_id,
  post.content,
  count(
    CASE
      WHEN reaction.reaction_type IN("LIKE", "LIT", "WOW", "LOVE") THEN 1
      ELSE NULL
    END
  ) AS positive_reactions_count,
  count(
    CASE
      WHEN reaction.reaction_type = "DISLIKE" THEN 1
      ELSE NULL
    END
  ) AS negative_reactions_count
FROM
  post
  LEFT JOIN reaction ON post.post_id = reaction.post_id
GROUP BY
  post.post_id
HAVING
  negative_reactions_count > positive_reactions_count
ORDER BY
  post.post_id ASC;





SELECT
  comment_id,
  comment_content,
  commented_by,
  commented_at
FROM
  COMMENT
WHERE
  post_id = 5
ORDER BY
  commented_at ASC;





SELECT
  post.post_id AS post_id,
  post.posted_by AS posted_by,
  post.content AS content,
  post.posted_at AS posted_at,
  COMMENT.comment_id AS comment_id,
  COMMENT.comment_content AS comment_content,
  COMMENT.commented_at AS commented_at
FROM
  (
    post
    LEFT JOIN COMMENT ON post.post_id = COMMENT.post_id
  ) AS t
  INNER JOIN user ON user.user_id = t.posted_by
WHERE
  user_id = 98
ORDER BY
  post.post_id ASC,
  COMMENT.commented_at DESC;




SELECT
  post.post_id AS post_id,
  post.posted_by AS posted_by,
  post.content AS content,
  post.posted_at AS posted_at,
  count(COMMENT.commented_by) AS comments_count
FROM
  (
    post
    LEFT JOIN COMMENT ON post.post_id = COMMENT.post_id
  ) AS t
  INNER JOIN user ON user.user_id = t.posted_by
WHERE
  user.user_id = 98
GROUP BY
  post.post_id
ORDER BY
  post.post_id ASC;