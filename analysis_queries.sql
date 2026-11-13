/* =====================================================================
   Clapping Hands Childcare Centre - Analysis Queries (Microsoft SQL Server)
   Author : Ravina Gaikwad
   Purpose: Business questions answered from the 10-table centre database
            (2020-2022, ~28,700 records) that feed the Power BI dashboards.
   ===================================================================== */


/* ---------------------------------------------------------------------
   Q1. How fast is enrolment growing year on year?
   Result: 40 -> 48 -> 59 children (+20.0%, +22.9%; +48% over 2020-2022)
   --------------------------------------------------------------------- */
WITH yearly AS (
    SELECT year, COUNT(DISTINCT child_id) AS children_enrolled
    FROM Enrolment
    GROUP BY year
)
SELECT
    year,
    children_enrolled,
    LAG(children_enrolled) OVER (ORDER BY year) AS previous_year,
    ROUND(100.0 * (children_enrolled - LAG(children_enrolled) OVER (ORDER BY year))
          / LAG(children_enrolled) OVER (ORDER BY year), 1) AS yoy_growth_pct
FROM yearly
ORDER BY year;


/* ---------------------------------------------------------------------
   Q2. How many children are new admissions vs continuing each year?
   Result: new admissions 2 -> 13 -> 15
   --------------------------------------------------------------------- */
SELECT
    year,
    SUM(CASE WHEN new_admission = 1 THEN 1 ELSE 0 END) AS new_children,
    SUM(CASE WHEN new_admission = 0 THEN 1 ELSE 0 END) AS continuing_children,
    COUNT(*) AS total_enrolments
FROM Enrolment
GROUP BY year
ORDER BY year;


/* ---------------------------------------------------------------------
   Q3. Which educators are at the 1:10 educator-to-child ratio limit?
   Result (2022): 5 of 6 educators at capacity (10 children each)
   --------------------------------------------------------------------- */
SELECT
    e.year,
    RTRIM(ed.educator_name) AS educator_name,
    COUNT(e.child_id) AS children_assigned,
    CASE WHEN COUNT(e.child_id) >= 10 THEN 'At capacity'
         ELSE 'Has space' END AS capacity_status
FROM Enrolment AS e
JOIN Educator  AS ed ON ed.educator_id = e.educator_id
GROUP BY e.year, RTRIM(ed.educator_name)
ORDER BY e.year, children_assigned DESC;


/* ---------------------------------------------------------------------
   Q4. How much unmet demand is there? (waitlist by year)
   Result: 18, 28, 24 children -> 70 in total
   --------------------------------------------------------------------- */
SELECT
    year,
    COUNT(*) AS children_on_waitlist,
    SUM(COUNT(*)) OVER (ORDER BY year) AS running_total
FROM ChildWaitlist
GROUP BY year
ORDER BY year;


/* ---------------------------------------------------------------------
   Q5. Child attendance rate by year
   Result: steady at ~76% each year (25,162 attendance records)
   --------------------------------------------------------------------- */
SELECT
    year,
    COUNT(*) AS attendance_records,
    ROUND(100.0 * SUM(CAST(attendance AS INT)) / COUNT(*), 1) AS attendance_rate_pct
FROM ChildAttendance
GROUP BY year
ORDER BY year;


/* ---------------------------------------------------------------------
   Q6. Rank educators by average overall rating (2020-2022)
   Result: Yogesh highest (7.0), Punam lowest (6.0) -> training focus
   --------------------------------------------------------------------- */
SELECT
    RTRIM(ed.educator_name) AS educator_name,
    ROUND(AVG(r.teaching_style), 2)   AS avg_teaching_style,
    ROUND(AVG(r.attendance_trend), 2) AS avg_attendance_trend,
    ROUND(AVG(r.overall_rating), 2)   AS avg_overall_rating,
    RANK() OVER (ORDER BY AVG(r.overall_rating) DESC) AS rating_rank
FROM EducatorRating AS r
JOIN Educator       AS ed ON ed.educator_id = r.educator_id
GROUP BY RTRIM(ed.educator_name)
ORDER BY rating_rank;


/* ---------------------------------------------------------------------
   Q7. Which activities keep children happiest?
   (share of attended sessions where the recorded mood was 'cheerful')
   Result: Playing with toys / Outdoor playing ~31% vs Crafting 3%, Lego 4%
   --------------------------------------------------------------------- */
SELECT
    a.activity_name,
    COUNT(*) AS attended_sessions,
    ROUND(100.0 * SUM(CASE WHEN ca.mood = 'cheerful' THEN 1 ELSE 0 END) / COUNT(*), 1) AS cheerful_pct
FROM ChildAttendance AS ca
JOIN Activity        AS a ON a.activity_id = ca.activity_id
WHERE ca.attendance = 1
GROUP BY a.activity_name
ORDER BY cheerful_pct DESC;


/* ---------------------------------------------------------------------
   Q8. Family needs: transport mode and after-hours care
   Result: car is the most common transport (36.8%); 60% of children use after-hours care
   --------------------------------------------------------------------- */
SELECT
    mode_of_transport,
    COUNT(*) AS children,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_children,
    SUM(CASE WHEN after_hour = 1 THEN 1 ELSE 0 END) AS using_after_hours_care
FROM Child
GROUP BY mode_of_transport
ORDER BY children DESC;
