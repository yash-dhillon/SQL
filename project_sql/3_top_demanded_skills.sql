WITH remote_job_skillss AS
(SELECT 
skill_id,
COUNT(*) AS skill_countt

FROM
skills_job_dim

JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id

WHERE 
job_title_short = 'Data Analyst' AND
job_work_from_home = True

GROUP BY skill_id)

SELECT 
sd.skills,
SUM(skill_countt) AS total_skill_count

FROM 
skills_dim sd

JOIN remote_job_skillss rjs ON rjs.skill_id = sd.skill_id

GROUP BY sd.skills

ORDER BY total_skill_count DESC

LIMIT 5;
