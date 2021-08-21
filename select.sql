--Пациент и его диагноз
SELECT pd.ID, p.surname, rd.name
FROM PRESCRIBED_DIAGNOSIS pd 
INNER JOIN Patience p 
ON pd.ID_PATIENCE = p.ID 
INNER JOIN Reference_Diagnosis rd 
ON pd.ID_DIAGNOSIS = rd.ID;

-- Все сотрудники и их должности
SELECT e.surname, p.NamePost
FROM Employees e LEFT JOIN Post p 
ON p.ID = e.ID_POST;

-- Название лекарства и его тип, и наименование диагноза
SELECT m2.name_medicines, m1.NAME_MEDICINES, rd.name FROM Medicines m1 
INNER JOIN Medicines m2 ON m1.ID_GROUP = m2.ID
INNER JOIN Reference_Diagnosis rd ON rd.ID = m1.ID_DIAGNOSIS;

-- Диагнозы, назначенные для пациентов
SELECT p.surname, p.name, rd.name AS Diagnosis, rd.DESCRIPTION
FROM Reference_Diagnosis rd INNER JOIN PRESCRIBED_DIAGNOSIS pd
ON rd.ID = pd.ID_DIAGNOSIS
INNER JOIN Patience p ON p.id = pd.ID_PATIENCE;

--Курс лечения, лекарства назначенные индвидуально для пациента его лечащим врачем
SELECT CONCAT (CONCAT(p.surname, ' '), p.NAME )AS sick, rd.NAME AS Diagnosis,
CONCAT (CAST (ct.time AS VARCHAR2(150 CHAR)), ' Hours') AS Time_treatment, ct.DESCRIPTION AS recommendation,
med.NAME_MEDICINES, CONCAT (CONCAT (e.SURNAME, ' '), e.NAME) AS Doctor
FROM PRESCRIBED_DIAGNOSIS pd INNER JOIN course_treatment ct
ON pd.ID = ct.ID
INNER JOIN Patience p ON p.ID = pd.ID_PATIENCE 
INNER JOIN Reference_Diagnosis rd ON rd.ID = pd.ID_DIAGNOSIS
INNER JOIN 
(SELECT m1.ID_DIAGNOSIS, m1.Name_medicines 
FROM Medicines m1 INNER JOIN Medicines m2
ON m1.ID_GROUP = m2.ID) med 
ON med.ID_DIAGNOSIS = rd.ID
INNER JOIN Employees e ON e.ID = p.ID_EMPLOYEE;

--доктора, у которых кол-во пациентов не менее 2
SELECT e.surname AS doctor, COUNT (p.surname) count_patience
FROM Employees e INNER JOIN patience p
ON e.id = p.ID_EMPLOYEE
GROUP BY e.surname
HAVING COUNT(p.surname) >=2;

-- кол-во препаратов в каждом виде
SELECT m1.NAME_MEDICINES, COUNT (m2.NAME_MEDICINES)
FROM medicines m1 INNER JOIN medicines m2
ON m1.ID = m2.ID_GROUP
GROUP BY m1.NAME_MEDICINES;

--Вывести имена и должности всех сотрудкников, которые устроились в прошлом году
SELECT pred_empl.SURNAME, pred_empl.NAME, p.NAMEPOST, pred_date
FROM
(SELECT id_post,surname, name,
SUBSTR(CAST (TO_DATE (DateModified, 'DD/MM/YY')AS VARCHAR2(150 CHAR)), INSTR (CAST (TO_DATE (DateModified, 'DD/MM/YY')AS VARCHAR2(150 CHAR)),'-', 4)+1, 2) AS pred_date
FROM Employees e) pred_empl
INNER JOIN Post p
ON pred_empl.ID_POST = p.Id
WHERE SUBSTR(CAST (TO_DATE (sysdate, 'DD/MM/YY')AS VARCHAR2(150 CHAR)), INSTR (CAST (TO_DATE (sysdate, 'DD/MM/YY')AS VARCHAR2(150 CHAR)),'-', 4)+1, 2)-1 = pred_date; 

select * from employees;

UPDATE Employees e
SET e.DATEMODIFIED = TO_DATE ('09/04/2089', 'DD/MM/YY')
WHERE e.ID = 1;

-- все сотруднкии, которые устроились в апреле
SELECT Surname, name, d
FROM 
(SELECT Surname, name,
CAST (TO_DATE (DateModified, 'DD/MM/YY') AS VARCHAR2(150 CHAR)) AS d
FROM Employees e) t
WHERE t.d LIKE '%APR%';


--Все DML операции, которые совершались над DB_medic за последний час
SELECT *
FROM PROTOCOL
WHERE Date_action >=sysdate - (60.0/1440.0)
order by dATE_ACTION DESC;

-- все DML опреации, которые совершались в период с 18.01.2021 по 20.01.2021
SELECT * FROM PROTOCOL
WHERE TO_DATE (date_action, 'DD/MM/YY') BETWEEN TO_DATE('18/01/2021', 'DD/MM/YY') AND TO_DATE('20/01/2021', 'DD/MM/YY');

-- Все пациенты, пришедшие в январе 2021 года
select *  from PATIENCE
where 
EXTRACT (MONTH FROM DATEMODIFIED) = 1 AND EXTRACT (YEAR FROM DATEMODIFIED) = 2021;

--диагнозы, назначенные в первое или последнее число любого месяца
SELECT p.surname, p.name, rd.name AS Diagnosis, rd.DESCRIPTION --, PD.DATEMODIFIED, TRUNC(PD.DATEMODIFIED, 'mm'), LAST_DAY(PD.DATEMODIFIED)
FROM Reference_Diagnosis rd INNER JOIN PRESCRIBED_DIAGNOSIS pd
ON rd.ID = pd.ID_DIAGNOSIS
INNER JOIN Patience p ON p.id = pd.ID_PATIENCE
WHERE TRUNC (PD.DATEMODIFIED, 'MM') = TO_DATE (PD.DATEMODIFIED) OR LAST_DAY (PD.DATEMODIFIED)= TO_DATE (PD.DATEMODIFIED);




SELECT * FROM PRESCRIBED_DIAGNOSIS;

UPDATE PRESCRIBED_DIAGNOSIS 
SET datemodified = TO_DATE ('31.12.2020', 'DD.MM.YY')
WHERE id = 2;
--datemodified BETWEEN TRUNC(DATEMODIFIED, 'mm') and LAST_DAY(datemodified)




