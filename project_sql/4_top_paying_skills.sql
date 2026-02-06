/* 
Question: WHAT ARE THE TOP PAYING SKILLS FOR DATA-ANALYSTS?
- Look at the average salary associted with each skill
- Focus on roles with specified salalries, regardless of location
- Why? It reveals how different skills impact salary level for data analysts and helps identitfy the most financially rewarding skills to acquire or improve
*/

SELECT
  skills,
  ROUND(AVG(salary_year_avg),0) AS avg_salary
  -- COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postiings_fact
INNER JOIN skills_job_dim ON job_postiings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
  -- AND job_work_from_home = True
GROUP BY
  skills
ORDER BY
  avg_salary DESC
LIMIT 25