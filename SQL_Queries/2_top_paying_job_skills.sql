/*
QUESTION: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- WHY? It provides a detailed look t which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id, 
        job_title,
        company_dim.name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 
    10
)
SELECT
    skills_dim.skills AS skill_name, 
    COUNT (top_paying_jobs.job_id) AS frequency_of_skill
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY
    skill_name
ORDER BY
    frequency_of_skill DESC
LIMIT 10


/* The skills for the top-10-paying jobs:
"skill_name","frequency_of_skill"
"sql","8"
"python","7"
"tableau","6"
"r","4"
"snowflake","3"
"pandas","3"
"excel","3"
"atlassian","2"
"azure","2"
"jira","2"
*/