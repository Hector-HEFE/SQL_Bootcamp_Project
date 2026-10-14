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


/* The skills for the top-10-paying jobs:
"job_id","job_title","company_name","salary_year_avg","skill_name"
552322,"Associate Director- Data Insights","AT&T","255829.5","sql"
552322,"Associate Director- Data Insights","AT&T","255829.5","python"
552322,"Associate Director- Data Insights","AT&T","255829.5","r"
552322,"Associate Director- Data Insights","AT&T","255829.5","azure"
552322,"Associate Director- Data Insights","AT&T","255829.5","databricks"
552322,"Associate Director- Data Insights","AT&T","255829.5","aws"
552322,"Associate Director- Data Insights","AT&T","255829.5","pandas"
552322,"Associate Director- Data Insights","AT&T","255829.5","pyspark"
552322,"Associate Director- Data Insights","AT&T","255829.5","jupyter"
552322,"Associate Director- Data Insights","AT&T","255829.5","excel"
552322,"Associate Director- Data Insights","AT&T","255829.5","tableau"
552322,"Associate Director- Data Insights","AT&T","255829.5","power bi"
552322,"Associate Director- Data Insights","AT&T","255829.5","powerpoint"
99305,"Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","sql"
99305,"Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","python"
99305,"Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","r"
99305,"Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","hadoop"
99305,"Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","tableau"
1021647,"Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","sql"
1021647,"Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","crystal"
1021647,"Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","oracle"
1021647,"Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","tableau"
1021647,"Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","flow"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","sql"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","python"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","go"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","snowflake"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","pandas"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","numpy"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","excel"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","tableau"
168310,"Principal Data Analyst (Remote)","SmartAsset","205000.0","gitlab"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","sql"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","python"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","azure"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","aws"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","oracle"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","snowflake"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","tableau"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","power bi"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","sap"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","jenkins"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","bitbucket"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","atlassian"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","jira"
731368,"Director, Data Analyst - HYBRID","Inclusively","189309.0","confluence"
310660,"Principal Data Analyst, AV Performance Analysis","Motional","189000.0","sql"
310660,"Principal Data Analyst, AV Performance Analysis","Motional","189000.0","python"
310660,"Principal Data Analyst, AV Performance Analysis","Motional","189000.0","r"
310660,"Principal Data Analyst, AV Performance Analysis","Motional","189000.0","git"
310660,"Principal Data Analyst, AV Performance Analysis","Motional","189000.0","bitbucket"
310660,"Principal Data Analyst, AV Performance Analysis","Motional","189000.0","atlassian"
310660,"Principal Data Analyst, AV Performance Analysis","Motional","189000.0","jira"
310660,"Principal Data Analyst, AV Performance Analysis","Motional","189000.0","confluence"
1749593,"Principal Data Analyst","SmartAsset","186000.0","sql"
1749593,"Principal Data Analyst","SmartAsset","186000.0","python"
1749593,"Principal Data Analyst","SmartAsset","186000.0","go"
1749593,"Principal Data Analyst","SmartAsset","186000.0","snowflake"
1749593,"Principal Data Analyst","SmartAsset","186000.0","pandas"
1749593,"Principal Data Analyst","SmartAsset","186000.0","numpy"
1749593,"Principal Data Analyst","SmartAsset","186000.0","excel"
1749593,"Principal Data Analyst","SmartAsset","186000.0","tableau"
1749593,"Principal Data Analyst","SmartAsset","186000.0","gitlab"
387860,"ERM Data Analyst","Get It Recruit - Information Technology","184000.0","sql"
387860,"ERM Data Analyst","Get It Recruit - Information Technology","184000.0","python"
387860,"ERM Data Analyst","Get It Recruit - Information Technology","184000.0","r"
*/