# SQL-Management-System
Oracle SQL database project for managing online courses and analytical queries 
# 📚 Online Course Management System - Oracle SQL Database

Bu layihə onlayn təhsil platformalarının məlumat bazasının strukturunu qurmaq və mürəkkəb analitik sorğular (Advanced SQL Queries) vasitəsilə biznes qərarları üçün məlumat əldə etmək məqsədilə Oracle SQL mühitində işlənib hazırlanmışdır.

---

## 🛠️ İstifadə Olunan Texnologiyalar
* *Verilənlər Bazası İdarəetmə Sistemi (DBMS):* Oracle Database
* *İdarəetmə Aləti:* Oracle SQL Developer
* *Konsepsiyalar:* Relational Database Design (ERD), Joins, Subqueries, Aggregations, Analytical Functions.

---

## 🗄️ Verilənlər Bazasının Strukturu (Database Schema)
Layihə aşağıdakı əsas cədvəllərdən və onların arasındakı əlaqələrdən (Relationships) ibarətdir:
1. *Students (Tələbələr):* Tələbələrin şəxsi məlumatları və qeydiyyat tarixləri.
2. *Instructors (Müəllimlər):* Kurs təlimçiləri və onların ixtisas sahələri.
3. *Courses (Kurslar):* Təklif olunan kursların siyahısı, qiymətləri və kateqoriyaları.
4. *Enrollments (Qeydiyyatlar):* Tələbələrin hansı kurslara qoşulduğunu izləyən əlaqə cədvəli (Many-to-Many əlaqəsi üçün).
5. *Payments / Progress (Ödənişlər və İrəliləyiş):* Maliyyə axını və tələbələrin kursu bitirmə faizləri.

---

## 🔍 Əsas Analitik Sorğular və Funksionallıqlar (Key Queries)
Bu bazada aşağıdakı mürəkkəb biznes suallarına cavab tapmaq üçün analitik sorğular yazılmışdır:
* *Aylıq Gəlir Analizi:* Müəyyən dövr ərzində kurslar üzrə əldə edilən ümumi gəlirin qruplaşdırılması.
* *Aktiv Tələbə Sayı:* Hansı kursların daha çox tələbə cəlb etdiyinin GROUP BY və ORDER BY vasitəsilə reytinqi.
* *Subquery-lərdən İstifadə:* Orta qiymətdən baha olan kursları və ya heç bir kursa qeydiyyatdan keçməyən tələbələri müəyyənləşdirən alt-sorğular.
* *Kompleks Join-lər:* Tələbə, kurs və müəllim məlumatlarını tək bir hesabatda birləşdirən INNER JOIN və LEFT JOIN struktur sorğuları.

---

## 🚀 Layihəni Necə İşlətmək Olar? (How to Run)
1. Kodu yoxlamaq üçün *Oracle SQL Developer* və ya uyğun Oracle verilənlər bazası mühitini açın.
2. create_tables.sql skriptini icra edərək cədvəlləri və əlaqələri yaradın.
3. insert_data.sql skripti vasitəsilə cədvəllərə nümunə məlumatlar (dummy data) daxil edin.
4. analytical_queries.sql faylındakı sorğuları işlədərək nəticələri əldə edin.
