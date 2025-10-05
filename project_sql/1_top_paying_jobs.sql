SELECT 
job_id,
job_title,
job_location,
job_schedule_type,
salary_year_avg,
job_posted_date,
name AS company_name

FROM 
job_postings_fact jpf
LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id

WHERE 
job_title_short = 'Data Analyst' AND 
job_location = 'Anywhere' AND 
salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC

LIMIT 10;