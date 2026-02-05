SELECT
  quarter1_job_postings.job_TITLE_SHORT,
  quarter1_job_postings.job_location,
  quarter1_job_postings.job_via,
  quarter1_job_postings.job_posted_date::DATE,
  quarter1_job_postings.salary_year_avg
FROM (
  SELECT *
  FROM january_jobs
  UNION ALL
  SELECT *
  FROM february_jobs
  UNION ALL
  SELECT *
  FROM march_jobs
) AS quarter1_job_postings
WHERE
  quarter1_job_postings.salary_year_avg>7000 AND
  quarter1_job_postings.job_title ='Data Analyst'
ORDER BY
  quarter1_job_postings.salary_year_avg DESC