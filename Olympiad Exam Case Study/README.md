# Olympiad Exam Performance Analysis Case Study

We conduct Olympiad exam for our partner schools every year to evaluate the standard of the students. Here we have provided you with the sample data for the exam. 
To get a proper insight about the exam you need all the 4 tables.
1. Student_list - List of students who attended the Olympiad exam from Google Public School.
2. Student_response - The Learn Basics Olympiad is an objective exam, student response for every question was recorded in this table. 
   5 options ("A', 'B', 'C, 'D' and 'E') are provided for each question
3. Out of 5 options only "A', 'B', 'C' and D' are the valid options, students can pick E' option when they think they  haven't learnt the concept yet.
3. Correct_answers - This table has the correct answer for all the questions in math and science.
4. Question_paper_code -  Since we are dealing with 3 classes and 2 subjects, we are maintaining a separate question paper code for each class and each subject.

# Problem Statement

Now, the objective is to validate the student response and present it in a single table with list of columns mentioned below using SQL. 
<p> Required output table with column data

Output Column names - 

1. Roll_number
2. Student_name
3. Class
4. Section
5. School_name
6. Math_correct
7. Math_wrong
8. Math_yet_to_learn
9. Math_score
10. Math_percentage
11. Science_correct
12. Science_wrong
13. Science_yet_learn
14. Science_score
15. Science_percentage
