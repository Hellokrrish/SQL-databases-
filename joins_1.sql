# 1. Perform natural join between course and instructor table.
Note:
Do not apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.


SELECT
  *
FROM
  course NATURAL
  JOIN instructor;


# 2. Perform inner join betweenreviewandstudenttable.
Note:
Do not apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.


SELECT
  *
FROM
  review
  INNER JOIN student ON review.student_id = student.id;




# 3. Get all the reviews along with the course names.
Every review is associated with a course. So, we can perform an inner join on reviewandcoursetables.
Note:
Do not apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.



SELECT
  *
FROM
  review
  INNER JOIN course ON course.id = review.course_id;




# 4.Continuation of question 3.
Get all the reviews on the “Cyber Security” course.
Note:
We can perform inner join onreviewandcoursetable.
Do not apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.



SELECT
  *
FROM
  review
  INNER JOIN course ON course.id = review.course_id
WHERE
  course.name = "Cyber Security";



# 5. Get all the courses and corresponding reviews.
For every course, there need not be a review. So, we need to perform a left join between thecourseandreviewtables.
Note:
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem



SELECT
  *
FROM
  course
  LEFT JOIN review ON review.course_id = course.id;




# 6. Continuation of question 5.
For the “Cyber Security” course, get all the reviews using the left join between the courseandreviewtables.
Note:
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem


SELECT
  *
FROM
  course
  LEFT JOIN review ON course.id = review.course_id
WHERE
  course.name = "Cyber Security";




# 7.Continuation of question 5.
For the “Linux” course, get all the reviews using the left join between the courseandreviewtables.
Note:
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem



SELECT
  *
FROM
  course
  LEFT JOIN review ON course.id = review.course_id
WHERE
  course.name = "Linux";






# 8. In question 7, as the course “Linux” has no reviews, the columns corresponding to review table i.e id, content, etc., in the output has NULL value.
Now, to get all the courses that does not have any reviews, 
We shall perform left join between courseandreviewtables, and then filter the rows for whichreview.idis NULL
Note:
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem



SELECT
  course.name
FROM
  course
  LEFT JOIN review ON course.id = review.course_id
WHERE
  review.id isnull;



# 9.Get the full_name of students who have not enrolled in any course.
Note:
We can perform left join betweenstudentandstudent_coursetables, and then filter the rows for whichcourse_idis NULL
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.




SELECT
  full_name
FROM
  student
  LEFT JOIN student_course ON student.id = student_course.student_id
WHERE
  student_course.course_id isnull;



# 10. Get the course names in which no student has registered.
Note:
We can perform left join betweencourseandstudent_coursetables, and then filter the rows for whichstudent_idis NULL
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.



SELECT
  course.name
FROM
  course
  LEFT JOIN student_course ON course.id = student_course.course_id
WHERE
  student_id IS NULL;