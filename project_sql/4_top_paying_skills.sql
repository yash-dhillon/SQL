WITH skill_salary AS (
    SELECT 
        sd.skills,
        AVG(jpf.salary_year_avg) AS avg_salary
    FROM skills_job_dim sjd
    JOIN job_postings_fact jpf 
        ON sjd.job_id = jpf.job_id
    JOIN skills_dim sd 
        ON sjd.skill_id = sd.skill_id
    WHERE 
        jpf.job_title_short = 'Data Analyst'
        AND jpf.job_location = 'Anywhere'
        AND jpf.salary_year_avg IS NOT NULL
    GROUP BY 
        sd.skills
)
SELECT 
    skills,
    ROUND(avg_salary, 0) AS average_salary_usd
FROM 
    skill_salary
ORDER BY 
    avg_salary DESC
LIMIT 25;
