/*
Question: How does the average salary differ between Business Analysts, Data Analysts, and Data Scientists?
*/

-- Let's have a look at the different job titles in the data set.
SELECT
    DISTINCT(job_title_short)
FROM
    job_postings_fact
-- We will focus on Business Analysts, Data Analysts, and Data Scientists.

-- Compute average salary grouped by job title.
SELECT
    job_title_short,
    AVG(salary_year_avg) AS avg_yearly_salary
FROM
    job_postings_fact
WHERE
    job_title_short IN ('Business Analyst', 'Data Analyst', 'Data Scientist') AND
    NOT job_location = 'Anywhere' AND
    job_schedule_type = 'Full-time' AND
    salary_year_avg IS NOT NULL
GROUP BY
    job_title_short