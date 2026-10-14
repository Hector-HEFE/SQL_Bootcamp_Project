/*
QUESTION: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- WHY? It reveals how different skills impact salary levels for Data Analysts 
    and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
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
    skills_dim.skills
ORDER BY
    avg_salary DESC
LIMIT
    25

/*  Top skills based on salary:

ChatGPT Summary Analysis:
1. Big data and distributed computing skills command the highest salaries. PySpark leads the list at $208,172, followed by Couchbase and Watson at $160,515. These tools suggest that data analysts who can work with large datasets and scalable data-processing systems may access higher-paying opportunities.
2. Data analysts benefit from combining Python with modern data infrastructure. Pandas ($151,821), NumPy ($143,513), and scikit-learn ($125,781) feature alongside Databricks ($141,907), Airflow ($126,103), and Kubernetes ($132,500). This suggests that combining data analysis and machine learning foundations with data engineering and deployment tools can be valuable.
3. Database, cloud, and development workflow skills are also associated with strong pay. PostgreSQL averages $123,879, GCP $122,500, and GitLab $154,500. This indicates that employers may reward analysts who can do more than analyze data—particularly those who understand databases, cloud platforms, and collaborative software development.

"skills","avg_salary"
"pyspark","208172"
"bitbucket","189155"
"couchbase","160515"
"watson","160515"
"datarobot","155486"
"gitlab","154500"
"swift","153750"
"jupyter","152777"
"pandas","151821"
"elasticsearch","145000"
"golang","145000"
"numpy","143513"
"databricks","141907"
"linux","136508"
"kubernetes","132500"
"atlassian","131162"
"twilio","127000"
"airflow","126103"
"scikit-learn","125781"
"jenkins","125436"
"notion","125000"
"scala","124903"
"postgresql","123879"
"gcp","122500"
"microstrategy","121619"

*/