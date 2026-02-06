WITH skills_demand AS (
  SELECT
    skills_job_dim.skills_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
  FROM job_postiings_fact
  INNER JOIN skills_job_dim ON job_postiings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True AND
    salary_year_avg IS NOT NULL
  GROUP BY
    skill_id
  -- ORDER BY
  --   demand_count DESC

), average_salary AS (
  SELECT
    skills_job_dim.skills_id,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
    -- COUNT(skills_job_dim.job_id) AS demand_count
  FROM job_postiings_fact
  INNER JOIN skills_job_dim ON job_postiings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
    -- AND job_work_from_home = True
  GROUP BY
    skill_id
  -- ORDER BY
  --   avg_salary DESC
)

SELECT
  skills_demand.skill_id,
  skills_demand.skills,
  demand_count,
  avg_salary
FROM
  skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
HAVING
  COUNT(skills_job_dim.job_id) > 10
ORDER BY
  demand_count DESC,
  avg_salary DESC
LIMIT 25