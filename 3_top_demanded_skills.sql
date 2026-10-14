/*
QUESTION: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2.
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- WHY? Retrieves the top 5 skills with the highest deman in the job market,
    providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills_dim.skills, 
    COUNT(skills_dim.skill_id) AS frequency_of_skill
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    frequency_of_skill  DESC
LIMIT
    10

/* The most in-demand skills for data analysts:
"skills","frequency_of_skill"
"sql","7291"
"excel","4611"
"python","4330"
"tableau","3745"
"power bi","2609"
"r","2142"
"sas","1866"
"looker","868"
"azure","821"
"powerpoint","819"
*/