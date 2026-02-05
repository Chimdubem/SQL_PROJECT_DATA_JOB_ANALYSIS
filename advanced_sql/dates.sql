SELECT *
FROM job_postings_fact
LIMIT 20;

SELECT 
  job_title_short AS job,
  job_posted_date AS date,
  EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact
WHERE
 EXTRACT(MONTH FROM job_posted_date)  <3

SELECT 
  job_schedule_type AS job_type,
  AVG(salary_hour_avg) AS hourly_average,
  AVG(salary_year_avg) AS yearly_average
FROM 
  job_postings_fact
WHERE
  EXTRACT(MONTH FROM job_posted_date) >5
GROUP BY
  job_schedule_type



SELECT 
  job_schedule_type AS job_type,
  AVG(salary_hour_avg::INT) AS hourly_average,
  AVG(salary_year_avg::INT) AS yearly_average
FROM 
  job_postings_fact
WHERE
  EXTRACT(MONTH FROM job_posted_date) >5
GROUP BY
  job_schedule_type
LIMIT 10


SELECT
  COUNT(job_title_short),
  EXTRACT(MONTH FROM job_posted_date) as month
FROM job_postings_fact
GROUP BY month 


