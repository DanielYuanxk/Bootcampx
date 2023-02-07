SELECT
  avg(total_duration) AS average_total_duration
FROM
  (
    SELECT
      cohorts.name,
      sum(completed_at - started_at) AS total_duration
    FROM
      cohorts
      JOIN students ON cohorts.id = students.cohort_id
      JOIN assistance_requests ON students.id = assistance_requests.student_id
    GROUP BY
      cohorts.name
    ORDER BY
      total_duration
  ) AS total_duration;