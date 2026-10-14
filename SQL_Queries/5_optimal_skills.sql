/*
QUESTION: What are the most optimal skills to learn? (i.e., It's high demand and high pay)
- Identify skilss in high demand and associated with high average salaries for Data Analyst roles
- Concentrate on remote positions with specified salaries
- WHY? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id, 
        skills_dim.skills, 
        COUNT(skills_dim.skill_id) AS frequency_of_skill
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
), 

average_salary AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND (AVG (salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
)

SELECT
    skills_demand.skills,
    frequency_of_skill,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE frequency_of_skill > 10
ORDER BY
    avg_salary DESC,
     frequency_of_skill DESC
LIMIT 25;


-- Rewriting more concisely


SELECT
    skills_dim.skills,
    COUNT(skills_dim.skills) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
FROM
    skills_dim
INNER JOIN skills_job_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
HAVING
    COUNT(skills_dim.skills) > 10
ORDER BY    
    average_salary DESC
LIMIT 25;

/* Most optimal skills to learn? (i.e., It's high demand and high pay)

"skills","demand_count","average_salary"
"go","27","115320"
"confluence","11","114210"
"hadoop","22","113193"
"snowflake","37","112948"
"azure","34","111225"
"bigquery","13","109654"
"aws","32","108317"
"java","17","106906"
"ssis","12","106683"
"jira","20","104918"
"oracle","37","104534"
"looker","49","103795"
"nosql","13","101414"
"python","236","101397"
"r","148","100499"
"redshift","16","99936"
"qlik","13","99631"
"tableau","230","99288"
"ssrs","14","99171"
"spark","13","99077"
"c++","11","98958"
"sas","126","98902"
"sql server","35","97786"
"javascript","20","97587"
"power bi","110","97431"

*/