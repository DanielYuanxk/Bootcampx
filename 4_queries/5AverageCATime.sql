SELECT
  cohorts.name,
  avg(completed_at - started_at) AS average_assistance_time
FROM
  cohorts
  JOIN students ON students.cohort_id = cohorts.id
  JOIN assistance_requests ON students.id = assistance_requests.student_id
GROUP BY
  cohorts.name
ORDER BY
  average_assistance_time;