WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim 
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND job_location = 'Anywhere' 
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
)

SELECT 
    tpj.job_id,
    tpj.job_title,
    tpj.company_name,
    tpj.salary_year_avg,
    STRING_AGG(DISTINCT s.skills, ', ') AS required_skills
FROM top_paying_jobs tpj
JOIN skills_job_dim sjd 
    ON tpj.job_id = sjd.job_id
JOIN skills_dim s 
    ON sjd.skill_id = s.skill_id
GROUP BY 
    tpj.job_id, tpj.job_title, tpj.company_name, tpj.salary_year_avg
ORDER BY 
    tpj.salary_year_avg DESC
LIMIT 10;
