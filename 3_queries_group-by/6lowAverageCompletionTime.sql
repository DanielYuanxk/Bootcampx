SELECT
  students.name AS student,
  --sum(assignment_submissions.duration) / count(assignment_submissions.student_id) AS average_assignment_duration
  avg(assignment_submissions.duration) AS average_assignment_duration,
  avg(assignments.duration) AS average_estimated_duration
FROM
  students
  JOIN assignment_submissions ON students.id = assignment_submissions.student_id
  JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE
  students.end_date IS NULL
GROUP BY
  students.name
HAVING
  avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY
  average_assignment_duration;