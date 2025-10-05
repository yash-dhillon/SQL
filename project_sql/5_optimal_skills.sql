SELECT 
    MIN(s.skill_id) AS skill_id,
    s.skills,
    COUNT(j.job_id) AS skill_count,
    ROUND(AVG(j.salary_year_avg)) AS average_salary_usd
FROM skills_job_dim sj
JOIN job_postings_fact j ON j.job_id = sj.job_id
JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE j.job_title_short = 'Data Analyst'
      AND j.job_work_from_home = True
      AND j.salary_year_avg IS NOT NULL
GROUP BY s.skills
ORDER BY skill_count DESC, average_salary_usd DESC
LIMIT 25;

