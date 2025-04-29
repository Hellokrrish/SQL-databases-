# 1.Fetch all the courses that are being taught by “Alex”.
Note:
Solving this problem involves joining ofcoursetable andinstructortable. Note that both the tables haveinstructor_idcolumn in common.
As we only want the courses taught by "Alex", we have to apply filter condition.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.


SELECT
  course.id AS course_id,
  course.name AS course_name,
  instructor.full_name AS instructor_name
FROM
  course NATURAL
  JOIN instructor
WHERE
  instructor.full_name = "Alex";


# 2. Get all the reviews of “Cyber Security” course .
Note:
Solving this problem involves performing inner join onreviewandcoursetables.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.


SELECT
  course.name AS course_name,
  student_id,
  content
FROM
  review
  INNER JOIN course ON course.id = review.course_id
WHERE
  course.name = "Cyber Security";



# 3.For a student with student (id = 1), get all the courses and the scores she/he secured in the year 2021.
Note:
Solving this question involves performing inner join onstudent_courseandcoursetables.
You can get the year from the enrollment date.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.



SELECT
  student_course.student_id,
  course.name,
  student_course.score AS score
FROM
  student_course
  INNER JOIN course ON course.id = student_course.course_id
WHERE
  student_course.student_id = 1
  AND strftime('%Y', enrollment_date) = "2021";



# 4.Get all the student details who scored more than 70 in Cyber Security course (course_id = 15) in the year 2020.

Note:
Solving this question involves performing inner join onstudent_courseandstudenttables.
You can get the year from the enrollment date.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.


SELECT
  student_course.student_id AS student_id,
  student.full_name AS student_name,
  student_course.score AS score,
  student_course.course_id AS course_id,
  student_course.enrollment_date AS enrollment_date
FROM
  student_course
  INNER JOIN student ON student.id = student_course.student_id
WHERE
  student_course.score > 70
  AND cast(
    strftime("%Y", student_course.enrollment_date) AS int
  ) = 2020
  AND student_course.course_id = 15;


# 5.Get all the student_ids who enrolled for the "Machine Learning" course in 2021.

Note:
Solving this question involves performing inner join onstudent_courseandcoursetables.
You can get the year from the enrollment date.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.



SELECT
  student_course.student_id AS student_id,
  course.name AS course_name,
  student_course.enrollment_date AS enrollment_date
FROM
  student_course
  INNER JOIN course ON course.id = student_course.course_id
WHERE
  course.name = "Machine Learning"
  AND cast(
    strftime("%Y", student_course.enrollment_date) AS int
  ) = 2021;


# 6.
Continuation of question 5.
Get the number of students who enrolled for the "Machine Learning" course in 2021.

Note:
Solving this question involves performing inner join oncourseandstudent_coursetables.
You can get the year from the enrollment date.
We have to perform the count() aggregation.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.


SELECT
  course.name AS course_name,
  count() AS no_of_students
FROM
  student_course
  INNER JOIN course ON course.id = student_course.course_id
WHERE
  course.name = "Machine Learning"
  AND cast(
    strftime("%Y", student_course.enrollment_date) AS int
  ) = 2021;




# 7.
Get the number of courses taken by “Ram”.

Note:
You can get the year from the enrollment date
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem



SELECT
  count() AS no_of_courses
FROM
  (
    student
    INNER JOIN course ON student.id = course.id
  ) AS t
  INNER JOIN student_course ON t.id = student_course.student_id
WHERE
  student.full_name = "Ram";



# 8.
For all the students, get the total number of courses taken by each student.

A student need not register for any course as well. So, we need to perform a left join between thestudentandstudent_coursetables.

Note:
You can get the year from the enrollment date
As we have to calculate the number of courses for each student, we have to GROUP BY the students first and then perform the count() aggregation.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.



SELECT
  student.full_name,
  count(student_course.course_id) AS no_of_courses
FROM
  student
  LEFT JOIN student_course ON student.id = student_course.student_id
GROUP BY
  student.id;




# 9.
Get the students who have taken at least 2 courses.

Note:
Solving this problem involves performing join operations onstudentandstudent_coursetables.
Use HAVING clause to filter the students who have taken at least two courses.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.



SELECT
  student.full_name,
  count(student_course.course_id) AS no_of_courses
FROM
  student
  LEFT JOIN student_course ON student.id = student_course.student_id
GROUP BY
  student.id
HAVING
  no_of_courses >= 2;




# 10.
Get all the students details and all the courses for which they have enrolled.

Note:
Here, we have to join student, student_course and course tables.
Performing left join between the student and student_course tables
perform left join on the combined table and course table.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.




SELECT
  student.id AS student_id,
  student.full_name AS student_name,
  course.id AS course_id,
  course.name AS course_name,
  student_course.score AS score,
  student_course.enrollment_date AS enrollment_date
FROM
  student
  LEFT JOIN student_course ON student.id = student_course.student_id
  LEFT JOIN course ON course.id = student_course.course_id;


# 11.
Get all the student details who enrolled for the “Machine Learning” course in the year 2021.

Note:
Here, we have to join student, student_course and course tables.
Apply filters on the combined table.
You can get the year from the enrollment date.
Don't apply ORDER BY, LIMIT, OFFSET clauses as it is not required for this problem.



SELECT
  student.id AS student_id,
  student.full_name AS full_name,
  course.id AS course_id,
  course.name AS course_name,
  student_course.enrollment_date AS enrollment_date
FROM
  student
  LEFT JOIN student_course ON student.id = student_course.student_id
  LEFT JOIN course ON course.id = student_course.course_id
WHERE
  course.name = "Machine Learning"
  AND cast(
    strftime("%Y", student_course.enrollment_date) AS int
  ) = 2021; 