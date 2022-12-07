-- Solution :

with cte AS (
    SELECT sl.Roll_number, sl.student_name, sl.class,
    sl.section, sl.school_name, 
    SUM(CASE WHEN pc.subject = 'Math' AND sr.option_marked = ca.correct_option AND  sr.option_marked <> 'e' THEN 1 ELSE 0 END) 
    AS math_correct, 
    SUM(CASE WHEN pc.subject = 'Math' AND sr.option_marked <> ca.correct_option AND  sr.option_marked <> 'e' THEN 1 ELSE 0 END) 
    AS math_wrong, 
    SUM(CASE WHEN pc.subject = 'Math' AND sr.option_marked = 'e' THEN 1 ELSE 0 END ) AS math_yet_to_learn,
    SUM(CASE WHEN pc.subject = 'Math' THEN 1 ELSE 0 END ) AS math_total,
    SUM(CASE WHEN pc.subject = 'Science' AND sr.option_marked = ca.correct_option AND  sr.option_marked <> 'e' THEN 1 ELSE 0 END) 
    AS Science_correct, 
    SUM(CASE WHEN pc.subject = 'Science' AND sr.option_marked <> ca.correct_option AND  sr.option_marked <> 'e' THEN 1 ELSE 0 END)
    AS Science_wrong, 
    SUM(CASE WHEN pc.subject = 'Science' AND sr.option_marked = 'e' THEN 1 ELSE 0 END ) AS Science_yet_to_learn,
    SUM(CASE WHEN pc.subject = 'Science' THEN 1 ELSE 0 END ) AS Science_total

    FROM student_list sl 
    JOIN student_response sr
    ON sl.roll_number = sr.roll_number 
    JOIN correct_answer ca 
    ON sr.question_number = ca.question_number 
    AND sr.question_paper_code = ca.question_paper_code
    JOIN question_paper_code pc 
    ON pc.paper_code = ca.question_paper_code 
    GROUP BY sl.Roll_number, sl.student_name, sl.class, sl.section, sl.school_name)
    
SELECT roll_number,student_name,class,section,school_name, math_correct, math_wrong, math_yet_to_learn, 
math_correct AS math_score, 
ROUND((CAST(math_correct AS decimal)/CAST(math_total AS Decimal))*100,2) as math_percentage, Science_correct, science_wrong, Science_yet_to_learn, science_correct AS science_score, 
ROUND((CAST(science_correct AS decimal)/CAST(science_total AS Decimal))*100,2) as science_percentage
FROM cte; 
