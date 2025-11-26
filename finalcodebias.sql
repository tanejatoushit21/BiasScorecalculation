-- Compute correlations to BiasScore_1to10
SELECT 
    'LiteracyRate' AS Metric,
    (SUM((e.LiteracyRate - avgL)*(b.BiasScore_1to10 - avgB)) /
     SQRT(SUM(POWER(e.LiteracyRate - avgL,2))*SUM(POWER(b.BiasScore_1to10 - avgB,2)))) AS Correlation
FROM dbo.EducationData e
JOIN dbo.BiasScoreResults b ON e.Country = b.Country
CROSS JOIN (
    SELECT 
        AVG(LiteracyRate) AS avgL, 
        AVG(BiasScore_1to10) AS avgB 
    FROM dbo.EducationData e 
    JOIN dbo.BiasScoreResults b ON e.Country = b.Country
) stats

UNION ALL
SELECT 
    'Funding',
    (SUM((e.Funding - avgL)*(b.BiasScore_1to10 - avgB)) /
     SQRT(SUM(POWER(e.Funding - avgL,2))*SUM(POWER(b.BiasScore_1to10 - avgB,2))))
FROM dbo.EducationData e
JOIN dbo.BiasScoreResults b ON e.Country = b.Country
CROSS JOIN (
    SELECT 
        AVG(Funding) AS avgL, 
        AVG(BiasScore_1to10) AS avgB 
    FROM dbo.EducationData e 
    JOIN dbo.BiasScoreResults b ON e.Country = b.Country
) stats

UNION ALL
SELECT 
    'InternetAccess',
    (SUM((e.InternetAccess - avgL)*(b.BiasScore_1to10 - avgB)) /
     SQRT(SUM(POWER(e.InternetAccess - avgL,2))*SUM(POWER(b.BiasScore_1to10 - avgB,2))))
FROM dbo.EducationData e
JOIN dbo.BiasScoreResults b ON e.Country = b.Country
CROSS JOIN (
    SELECT 
        AVG(InternetAccess) AS avgL, 
        AVG(BiasScore_1to10) AS avgB 
    FROM dbo.EducationData e 
    JOIN dbo.BiasScoreResults b ON e.Country = b.Country
) stats

UNION ALL
SELECT 
    'StudentTeacherRatio',
    (SUM((e.StudentTeacherRatio - avgL)*(b.BiasScore_1to10 - avgB)) /
     SQRT(SUM(POWER(e.StudentTeacherRatio - avgL,2))*SUM(POWER(b.BiasScore_1to10 - avgB,2))))
FROM dbo.EducationData e
JOIN dbo.BiasScoreResults b ON e.Country = b.Country
CROSS JOIN (
    SELECT 
        AVG(StudentTeacherRatio) AS avgL, 
        AVG(BiasScore_1to10) AS avgB 
    FROM dbo.EducationData e 
    JOIN dbo.BiasScoreResults b ON e.Country = b.Country
) stats

UNION ALL
SELECT 
    'YouthUnemployment',
    (SUM((e.YouthUnemployment - avgL)*(b.BiasScore_1to10 - avgB)) /
     SQRT(SUM(POWER(e.YouthUnemployment - avgL,2))*SUM(POWER(b.BiasScore_1to10 - avgB,2))))
FROM dbo.EducationData e
JOIN dbo.BiasScoreResults b ON e.Country = b.Country
CROSS JOIN (
    SELECT 
        AVG(YouthUnemployment) AS avgL, 
        AVG(BiasScore_1to10) AS avgB 
    FROM dbo.EducationData e 
    JOIN dbo.BiasScoreResults b ON e.Country = b.Country
) stats;
