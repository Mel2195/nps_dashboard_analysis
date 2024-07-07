## SQL Queries

-- This section contains SQL queries used to analyze the NPS data and generate insights for the dashboard.

### 1. Overall NPS Score

-- Calculates the overall NPS score as of June 24, 2021.

SELECT 
    ROUND(
        (COUNT(CASE WHEN NPS = 'Promoter' THEN 1 END) - 
         COUNT(CASE WHEN NPS = 'Detractor' THEN 1 END)) * 100.0 / COUNT(*), 
        2
    ) AS Overall_NPS
FROM FACT_NPS_SCORE
WHERE CREATED_DATE <= '2021-06-24';

-- Calculates the running view of the NPS score over the past 30 days.

SELECT 
    DATE_TRUNC('day', CREATED_DATE) AS Date,
    ROUND(
        (COUNT(CASE WHEN NPS = 'Promoter' THEN 1 END) - 
         COUNT(CASE WHEN NPS = 'Detractor' THEN 1 END)) * 100.0 / COUNT(*), 
        2
    ) AS Daily_NPS
FROM FACT_NPS_SCORE
WHERE CREATED_DATE BETWEEN DATEADD(day, -30, '2021-06-24') AND '2021-06-24'
GROUP BY DATE_TRUNC('day', CREATED_DATE)
ORDER BY Date;

-- Filters to review NPS by different customer dimensions such as tier, ARR, and team size.

SELECT 
    c.TIER,
    c.ARR,
    c.TEAM_SIZE,
    ROUND(
        (COUNT(CASE WHEN f.NPS = 'Promoter' THEN 1 END) - 
         COUNT(CASE WHEN f.NPS = 'Detractor' THEN 1 END)) * 100.0 / COUNT(*), 
        2
    ) AS Dimension_NPS
FROM FACT_NPS_SCORE f
JOIN DIM_CUSTOMER c ON f.DOMAIN = c.NAME
WHERE f.CREATED_DATE <= '2021-06-24'
GROUP BY c.TIER, c.ARR, c.TEAM_SIZE
ORDER BY Dimension_NPS DESC;
