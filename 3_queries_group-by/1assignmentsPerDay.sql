SELECT
  DAY,
  count(*)
FROM
  assignments
GROUP BY
  DAY
ORDER BY
  DAY;