SELECT
  job_title_short,
  job_location
FROM job_postings_fact;

SELECT
  job_title_short,
  job_country,
  CASE
    WHEN salary_hour_avg<=20 OR salary_year_avg <=42000 THEN 'Low'
    WHEN salary_hour_avg<=40 OR salary_year_avg <70000 THEN 'Standard'
    WHEN salary_hour_avg>=41 OR salary_year_avg <200000 THEN 'High'
    ELSE 'Not stated'
  END AS salary_range
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'

SELECT
COUNT(job_location) AS number_of_jobs,
  CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
  END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category


SELECT 
  job_title_short,
  salary_year_avg,
  (salary_hour_avg*40*52) AS yearly_avg
FROM 
 job_postings_fact

SELECT
  job_title,
