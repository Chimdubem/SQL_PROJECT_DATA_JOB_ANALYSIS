/* 
Question: WHAT ARE THE TOP-PAYING ANALYST JOBS?
- I dentify the top 10 highest paying Data Analyst roles that are available remotly.
- Focuse on job postings with specified salaries
- Why? Hiighlight the top-paying opportunities for Data analysts, offering insights into employment ratess
*/

SELECT
  job_id,
  job_title,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date,
  name AS company_name 
FROM
  job_postiings_fact
LEFT JOIN company_dim ON job_postiings_fact.company_id=company_dim.company_id
WHERE
  job_title_short='Data Analyst' AND
  job_location = 'Anywhere' AND
  salary_year_avg IS NOT NULL
ORDER BY
  salary_year_avg DESC
LIMIT 10