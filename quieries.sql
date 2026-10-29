create TABLE students(
    student_id NUMBER PRIMARY key,
    full_name VARCHAR2(25),
    email VARCHAR2(25),
    phone VARCHAR2(25),
    city varchar2(25),
    registration_date DATE,  
    student_status VARCHAR2(25)
);
ALTER TABLE students
add CONSTRAINT chk_status 
CHECK(student_status in ('ACTIVE','INACTIVE','BLOCKED'));
INSERT into students  values(1,'Namiq Ceferov','namiq@gmail.com','0513224545','Baki',TO_DATE('2026-01-10','YYYY-MM-DD'),'ACTIVE');
INSERT INTO students VALUES (2, 'Aysel Vəliyeva', 'aysel@gmail.com', '0552223344', 'Baku', TO_DATE('2026-01-11', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO students VALUES (3, 'Leyla Əliyeva', 'leyla@gmail.com', '0703334455', 'Ganja', TO_DATE('2026-01-12', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO students VALUES (4, 'Murad İsmayılov', 'murad@gmail.com', '0504445566', 'Sumqayit', TO_DATE('2026-01-13', 'YYYY-MM-DD'), 'INACTIVE');
INSERT INTO students VALUES (5, 'Zaur Mustafayev', 'zaur@gmail.com', '0515556677', 'Baku', TO_DATE('2026-01-14', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO students VALUES (6, 'Elnur Qasımov', 'elnur@gmail.com', '0776667788', 'Ganja', TO_DATE('2026-01-15', 'YYYY-MM-DD'), 'BLOCKED');
INSERT INTO students VALUES (7, 'Ramil Həsənov', 'ramil@gmail.com', '0507778899', 'Sumqayit', TO_DATE('2026-01-16', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO students VALUES (8, 'Nərgiz Məmmədova', 'nargiz@gmail.com', '0558889900', 'Baku', TO_DATE('2026-01-17', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO students VALUES (9, 'Əli Məmmədov', 'ali@gmail.com', '0709990011', 'Baku', TO_DATE('2026-01-18', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO students VALUES (10, 'Anar Quliyev', 'anar@gmail.com', '0511110022', 'Sumqayit', TO_DATE('2026-01-19', 'YYYY-MM-DD'), 'INACTIVE');

SELECT * FROM STUDENTS;

--Teachers
create table teachers(
    teacher_id NUMBER PRIMARY KEY,
    full_name varchar2(25),
    specialization VARCHAR2(25),
    experience_year NUMBER,
    salary number ,
    teacher_status VARCHAR2(25) CHECK(teacher_status in( 'ACTIVE','INACTIVE','ON_LEAVE'))
);

INSERT INTO teachers VALUES (5, 'Kənan Quliyev', 'Design', 6, 1900, 'ACTIVE');
INSERT INTO teachers VALUES (6, 'Nigar Mustafayeva', 'Data Analytics', 8, 2400, 'ACTIVE');
INSERT INTO teachers VALUES (7, 'Elvin Əhmədov', 'Oracle SQL', 2, 1200, 'INACTIVE');
INSERT INTO teachers VALUES (8, 'Səbinə İbrahimova', 'Programming', 5, 1750, 'ON_LEAVE');

SELECT * FROM teachers;

--COURSES
create table courses (
    course_id number primary key ,
    course_name varchar2(50),
    category varchar2(50),
    price NUMBER ,
    duration_month number,
    level_name varchar2(25) ,
    course_status VARCHAR2(25) check( course_status in('OPEN','CLOSED','ARCHIEVE')),
    teacher_id NUMBER 
) ;

alter table courses
add CONSTRAINT cours_teacher
FOREIGN key(teacher_id) references teachers(teacher_id); 

INSERT INTO courses VALUES (1, 'Oracle SQL Beginner', 'Database', 300, 2, 'BEGINNER', 'OPEN', 5);
INSERT INTO courses VALUES (2, 'Python Fundamentals', 'Programming', 400, 3, 'BEGINNER', 'OPEN', 6);
INSERT INTO courses VALUES (3, 'Advanced Data Analytics', 'Data Analytics', 550, 4, 'ADVANCED', 'OPEN', 7);
INSERT INTO courses VALUES (4, 'Web Development Basics', 'Web Development', 350, 3, 'INTERMEDIATE', 'CLOSED', 8);
INSERT INTO courses VALUES (5, 'UI/UX Design Essentials', 'Design', 250, 2, 'BEGINNER', 'OPEN', 5);
INSERT INTO courses VALUES (6, 'Database Administration', 'Database', 600, 5, 'ADVANCED', 'ARCHIEVE', 5);

SELECT * FROM COURSES;

--ENROLLMENTS
create TABLE ENROLLMENTS(
    ENROLLMENT_ID  NUMBER primary key,
    student_id number REFERENCES students(student_id),
    course_id number references courses(course_id),
    enrollment_date date ,
    enrollment_status VARCHAR2(25) CHECK(enrollment_status in ('ACTIVE','COMPLETED','DROPPED'))
);
INSERT INTO enrollments VALUES (1, 1, 1, TO_DATE('2026-01-10', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (2, 2, 1, TO_DATE('2026-01-11', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (3, 3, 2, TO_DATE('2026-01-12', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (4, 4, 2, TO_DATE('2026-01-12', 'YYYY-MM-DD'), 'COMPLETED');
INSERT INTO enrollments VALUES (5, 5, 3, TO_DATE('2026-01-13', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (6, 6, 3, TO_DATE('2026-01-14', 'YYYY-MM-DD'), 'DROPPED');
INSERT INTO enrollments VALUES (7, 7, 4, TO_DATE('2026-01-15', 'YYYY-MM-DD'), 'COMPLETED');
INSERT INTO enrollments VALUES (8, 8, 4, TO_DATE('2026-01-15', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (9, 9, 5, TO_DATE('2026-01-16', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (10, 10, 5, TO_DATE('2026-01-17', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (11, 1, 2, TO_DATE('2026-01-18', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (12, 2, 3, TO_DATE('2026-01-18', 'YYYY-MM-DD'), 'COMPLETED');
INSERT INTO enrollments VALUES (13, 3, 5, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 'ACTIVE');
INSERT INTO enrollments VALUES (14, 4, 1, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 'DROPPED');
INSERT INTO enrollments VALUES (15, 5, 4, TO_DATE('2026-01-20', 'YYYY-MM-DD'), 'ACTIVE');

SELECT * FROM ENROLLMENTS;

--LESSONS
create table lessons (
    lesson_id number PRIMARY key ,
    course_id number REFERENCES courses(course_id),
    lesson_title VARCHAR2(50),
    lesson_date date,
    lesson_min NUMBER,
    lesson_status varchar2(50) CHECK(lesson_status in ('PLANNED','COMPLETED','CANCELLED'))
);
INSERT INTO lessons VALUES (1, 1, 'Introduction to Oracle SQL', TO_DATE('2026-01-15', 'YYYY-MM-DD'), 90, 'COMPLETED');
INSERT INTO lessons VALUES (2, 1, 'SELECT and WHERE Clauses', TO_DATE('2026-01-17', 'YYYY-MM-DD'), 90, 'COMPLETED');
INSERT INTO lessons VALUES (3, 1, 'SQL Joins and Aggregations', TO_DATE('2026-01-20', 'YYYY-MM-DD'), 90, 'PLANNED');
INSERT INTO lessons VALUES (4, 2, 'Python Basics and Variables', TO_DATE('2026-01-16', 'YYYY-MM-DD'), 120, 'COMPLETED');
INSERT INTO lessons VALUES (5, 2, 'Control Structures and Loops', TO_DATE('2026-01-18', 'YYYY-MM-DD'), 120, 'COMPLETED');
INSERT INTO lessons VALUES (6, 2, 'Python Functions and Modules', TO_DATE('2026-01-22', 'YYYY-MM-DD'), 120, 'PLANNED');
INSERT INTO lessons VALUES (7, 3, 'Data Cleaning in Excel and Python', TO_DATE('2026-01-15', 'YYYY-MM-DD'), 100, 'COMPLETED');
INSERT INTO lessons VALUES (8, 3, 'Exploratory Data Analysis', TO_DATE('2026-01-19', 'YYYY-MM-DD'), 100, 'CANCELLED');
INSERT INTO lessons VALUES (9, 3, 'Power BI Dashboards', TO_DATE('2026-01-23', 'YYYY-MM-DD'), 100, 'PLANNED');
INSERT INTO lessons VALUES (10, 4, 'HTML5 and CSS3 Basics', TO_DATE('2026-01-14', 'YYYY-MM-DD'), 60, 'COMPLETED');
INSERT INTO lessons VALUES (11, 4, 'JavaScript Fundamentals', TO_DATE('2026-01-17', 'YYYY-MM-DD'), 60, 'COMPLETED');
INSERT INTO lessons VALUES (12, 5, 'UI/UX Design Principles', TO_DATE('2026-01-13', 'YYYY-MM-DD'), 90, 'COMPLETED');
INSERT INTO lessons VALUES (13, 5, 'Figma Wireframing', TO_DATE('2026-01-16', 'YYYY-MM-DD'), 90, 'COMPLETED');
INSERT INTO lessons VALUES (14, 6, 'Database Backup and Recovery', TO_DATE('2026-01-10', 'YYYY-MM-DD'), 120, 'COMPLETED');
INSERT INTO lessons VALUES (15, 6, 'User Rights and Security', TO_DATE('2026-01-12', 'YYYY-MM-DD'), 120, 'CANCELLED');
 
select * from lessons;

--assignments
create table assignments(
    assignment_id number primary key,
    course_id number REFERENCES courses(course_id),
    title varchar2(100),
    max_score NUMBER,
    deadline date,
    assignment_status varchar2(50) check(assignment_status in ('OPEN','CLOSED','CANCELLED'))
);
INSERT INTO assignments VALUES (1, 1, 'SQL SELECT Practice', 100, TO_DATE('2026-01-20', 'YYYY-MM-DD'), 'OPEN');
INSERT INTO assignments VALUES (2, 1, 'SQL Joins and Group By Task', 100, TO_DATE('2026-01-25', 'YYYY-MM-DD'), 'OPEN');
INSERT INTO assignments VALUES (3, 2, 'Python Data Structures Homework', 100, TO_DATE('2026-01-22', 'YYYY-MM-DD'), 'OPEN');
INSERT INTO assignments VALUES (4, 2, 'Python Functions and Loops', 100, TO_DATE('2026-01-28', 'YYYY-MM-DD'), 'OPEN');
INSERT INTO assignments VALUES (5, 3, 'Data Cleaning Assignment', 100, TO_DATE('2026-01-18', 'YYYY-MM-DD'), 'CLOSED');
INSERT INTO assignments VALUES (6, 3, 'Power BI Dashboard Creation', 100, TO_DATE('2026-01-30', 'YYYY-MM-DD'), 'OPEN');
INSERT INTO assignments VALUES (7, 4, 'HTML and CSS Layout Project', 100, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 'CLOSED');
INSERT INTO assignments VALUES (8, 4, 'JavaScript DOM Manipulation', 100, TO_DATE('2026-01-26', 'YYYY-MM-DD'), 'OPEN');
INSERT INTO assignments VALUES (9, 5, 'Figma Landing Page Wireframe', 100, TO_DATE('2026-01-21', 'YYYY-MM-DD'), 'OPEN');
INSERT INTO assignments VALUES (10, 6, 'Database Recovery Case Study', 100, TO_DATE('2026-01-15', 'YYYY-MM-DD'), 'CANCELLED');

select * from ASSIGNMENTS;

--submissions
create table submissions(
    submission_id number PRIMARY key ,
    assignment_id number REFERENCES assignments(assignment_id),
    student_id number REFERENCES students(student_id),
    submitted_date date,
    score number CHECK(SCORE BETWEEN 0 and 100),
    submission_status VARCHAR2(50) CHECK(submission_status in ('SUBMITTED','LATE','NOT_SUBMITTED','GRADED'))
);
INSERT INTO submissions VALUES (1, 1, 1, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 95, 'GRADED');
INSERT INTO submissions VALUES (2, 1, 2, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 85, 'GRADED');
INSERT INTO submissions VALUES (3, 1, 3, TO_DATE('2026-01-20', 'YYYY-MM-DD'), 70, 'GRADED');
INSERT INTO submissions VALUES (4, 1, 4, TO_DATE('2026-01-21', 'YYYY-MM-DD'), 60, 'LATE');
INSERT INTO submissions VALUES (5, 2, 1, TO_DATE('2026-01-24', 'YYYY-MM-DD'), 90, 'GRADED');
INSERT INTO submissions VALUES (6, 2, 2, TO_DATE('2026-01-25', 'YYYY-MM-DD'), 88, 'GRADED');
INSERT INTO submissions VALUES (7, 3, 3, TO_DATE('2026-01-21', 'YYYY-MM-DD'), 100, 'GRADED');
INSERT INTO submissions VALUES (8, 3, 4, TO_DATE('2026-01-22', 'YYYY-MM-DD'), 75, 'GRADED');
INSERT INTO submissions VALUES (9, 3, 5, TO_DATE('2026-01-22', 'YYYY-MM-DD'), 0, 'NOT_SUBMITTED');
INSERT INTO submissions VALUES (10, 4, 3, TO_DATE('2026-01-27', 'YYYY-MM-DD'), 82, 'SUBMITTED');
INSERT INTO submissions VALUES (11, 4, 4, TO_DATE('2026-01-28', 'YYYY-MM-DD'), 91, 'SUBMITTED');
INSERT INTO submissions VALUES (12, 5, 5, TO_DATE('2026-01-17', 'YYYY-MM-DD'), 80, 'GRADED');
INSERT INTO submissions VALUES (13, 5, 6, TO_DATE('2026-01-18', 'YYYY-MM-DD'), 65, 'GRADED');
INSERT INTO submissions VALUES (14, 6, 5, TO_DATE('2026-01-29', 'YYYY-MM-DD'), 94, 'SUBMITTED');
INSERT INTO submissions VALUES (15, 6, 6, TO_DATE('2026-01-30', 'YYYY-MM-DD'), 0, 'NOT_SUBMITTED');
INSERT INTO submissions VALUES (16, 7, 7, TO_DATE('2026-01-18', 'YYYY-MM-DD'), 89, 'GRADED');
INSERT INTO submissions VALUES (17, 7, 8, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 78, 'GRADED');
INSERT INTO submissions VALUES (18, 8, 7, TO_DATE('2026-01-25', 'YYYY-MM-DD'), 92, 'SUBMITTED');
INSERT INTO submissions VALUES (19, 9, 9, TO_DATE('2026-01-20', 'YYYY-MM-DD'), 86, 'GRADED');
INSERT INTO submissions VALUES (20, 10, 10, TO_DATE('2026-01-14', 'YYYY-MM-DD'), 0, 'NOT_SUBMITTED');

select * from submissions;

--Payments
create table payments(
    payment_id number primary key ,
    student_id number references students(student_id),
    course_id number references courses(course_id),
    amount number CHECK(amount >0),
    payment_date date,
    payment_method varchar2(50) check(payment_method in ('CASH','CARD','TRANSFER')),
    payment_status varchar2(50) CHECK(payment_status IN ('PAID','PENDING','FAILED','REFUNDED'))
);
INSERT INTO payments VALUES (1, 1, 1, 300, TO_DATE('2026-01-10', 'YYYY-MM-DD'), 'CARD', 'PAID');
INSERT INTO payments VALUES (2, 2, 1, 300, TO_DATE('2026-01-11', 'YYYY-MM-DD'), 'CASH', 'PAID');
INSERT INTO payments VALUES (3, 3, 2, 400, TO_DATE('2026-01-12', 'YYYY-MM-DD'), 'TRANSFER', 'PAID');
INSERT INTO payments VALUES (4, 4, 2, 400, TO_DATE('2026-01-12', 'YYYY-MM-DD'), 'CARD', 'PAID');
INSERT INTO payments VALUES (5, 5, 3, 550, TO_DATE('2026-01-13', 'YYYY-MM-DD'), 'CARD', 'PENDING');
INSERT INTO payments VALUES (6, 6, 3, 550, TO_DATE('2026-01-14', 'YYYY-MM-DD'), 'TRANSFER', 'PAID');
INSERT INTO payments VALUES (7, 7, 4, 350, TO_DATE('2026-01-15', 'YYYY-MM-DD'), 'CASH', 'PAID');
INSERT INTO payments VALUES (8, 8, 4, 350, TO_DATE('2026-01-15', 'YYYY-MM-DD'), 'CARD', 'FAILED');
INSERT INTO payments VALUES (9, 9, 5, 250, TO_DATE('2026-01-16', 'YYYY-MM-DD'), 'CARD', 'PAID');
INSERT INTO payments VALUES (10, 10, 5, 250, TO_DATE('2026-01-17', 'YYYY-MM-DD'), 'CASH', 'PAID');
INSERT INTO payments VALUES (11, 1, 2, 400, TO_DATE('2026-01-18', 'YYYY-MM-DD'), 'CARD', 'PAID');
INSERT INTO payments VALUES (12, 2, 3, 550, TO_DATE('2026-01-18', 'YYYY-MM-DD'), 'TRANSFER', 'PAID');
INSERT INTO payments VALUES (13, 3, 5, 250, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 'CARD', 'REFUNDED');
INSERT INTO payments VALUES (14, 4, 1, 300, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 'CASH', 'PAID');
INSERT INTO payments VALUES (15, 5, 4, 350, TO_DATE('2026-01-20', 'YYYY-MM-DD'), 'TRANSFER', 'PAID');

select * from payments;
commit;

--Sade SQL sorgulari
--1
select full_name from students;

--2
select full_name from students where student_status='ACTIVE';

--3
select full_name from students where city='Baku';

--4
select course_name from courses where price > 300;

--5
select course_name from courses where course_status ='OPEN';

--JOIN sorgulari
--6
select c.course_name, t.full_name from courses c
join teachers t on c.teacher_id = t.teacher_id;

--7
select s.full_name, c.course_name
from students s
join payments p on s.student_id = p.student_id
join courses c on p.course_id = c.course_id;

--8
select s.full_name, p.amount from students s
join payments p on s.student_id = p.student_id;

--9
select c.course_name, l.lesson_title 
from courses c
join lessons l on c.course_id = l.course_id;

--10
select s.full_name, sbm.SCORE
from students s
join submissions sbm on s.student_id = sbm.student_id;

--GROUP BY SORGULARI
--11
select c.course_name, count(s.student_id)
from students s
join payments p on s.student_id = p.student_id
join courses c on p.course_id = c.course_id
group by c.course_name;

--12
select t.full_name, count(c.course_id)
from teachers t
join courses c on t.teacher_id = c.teacher_id
group by t.full_name;

--13
select c.course_name, sum(p.amount) 
from courses c
join payments p on c.course_id = p.course_id
group by c.course_name;

--14
select count(student_id), city
from students 
group by city;

--15
select payment_method, sum(amount) 
from payments
group by payment_method;

--Analitik Sorgular
--16
select c.course_name,
       sum(p.amount) as umumi_gelir,
       rank() over(order by sum(p.amount) desc) as sira
from courses c
join payments p on c.course_id = p.course_id
group by c.course_name
fetch first 1 rows only;

--17
select c.course_name,
       count(s.student_id),
       rank() over(order by count(s.student_id) desc)
from courses c
join payments p on c.course_id = p.course_id
join students s on p.student_id = s.student_id
group by c.course_name
fetch first 1 rows only;

--18
select s.full_name,
       avg(subm.SCORE) as ortalama_bal,
       rank() over(order by avg(subm.SCORE)) as sira
from students s 
join submissions subm on s.student_id = subm.student_id
group by s.full_name
having avg(subm.score) > 80;

--19
select distinct(c.course_name),
       round(100 * count(case when e.enrollment_status = 'COMPLETED' then 1 end) over(partition by c.COURSE_ID) / count(*) over(partition by c.course_id), 2) 
from courses c
join enrollments e on c.course_id = e.course_id;

--20
select std.full_name,
       avg(subm.score),
       rank() over(order by avg(subm.SCORE))
from students std
join submissions subm on std.student_id = subm.student_id
group by std.full_name;
