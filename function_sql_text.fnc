CREATE OR REPLACE FUNCTION Count_words (line_ IN CLOB)
RETURN INTEGER
IS
X INTEGER := 1;
BEGIN
    IF line_ = '' OR line_ IS NULL THEN
        x := 0;
        RETURN x;
    END IF;
FOR i IN 1..LENGTH(line_) LOOP
    IF SUBSTR(line_, i, 1) = ' ' THEN
        x := x + 1;
    END IF;
END LOOP;
RETURN X;
END;

CREATE OR REPLACE FUNCTION sql_text (flag IN INTEGER, tabl IN VARCHAR2)
RETURN clob
IS
TYPE r_person IS RECORD (
 SQLT v$sql.SQL_TEXT%TYPE
);
TYPE t_mas IS TABLE OF r_person INDEX BY PLS_INTEGER;
l_mas t_mas;
sqltext CLOB;
BEGIN
IF tabl = 'Employees' THEN
    IF flag = 1 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('UPDATE%Employe%') --AND TO_CHAR(first_load_time) =  to_char(sysdate, 'yyyy-mm-dd/hh24:mi:ss')
        ORDER BY FIRST_LOAD_TIME asc;
    END IF;
    IF flag = 2 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('INSERT%INTO%Employe%')
        ORDER BY FIRST_LOAD_TIME;
    END IF;
    IF flag = 3 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('DELETE%FROM%Employee%') 
        ORDER BY FIRST_LOAD_TIME;
    END IF;
END IF;
IF tabl = 'Post' THEN
    IF flag = 1 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('UPDATE%Post%') --AND TO_CHAR(first_load_time) =  to_char(sysdate, 'yyyy-mm-dd/hh24:mi:ss')
        ORDER BY FIRST_LOAD_TIME asc;
    END IF;
    IF flag = 2 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('INSERT INTO%Post%')
        ORDER BY FIRST_LOAD_TIME;
    END IF;
    IF flag = 3 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('DELETE FROM%Post%') 
        ORDER BY FIRST_LOAD_TIME;
    END IF;
END IF;
IF tabl = 'Reference_Diagnosis' THEN
    IF flag = 1 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('UPDATE Reference_Diagnosis%') --AND TO_CHAR(first_load_time) =  to_char(sysdate, 'yyyy-mm-dd/hh24:mi:ss')
        ORDER BY FIRST_LOAD_TIME asc;
    END IF;
    IF flag = 2 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('INSERT INTO Reference_Diagnosis%')
        ORDER BY FIRST_LOAD_TIME;
    END IF;
    IF flag = 3 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('DELETE FROM Reference_Diagnosis%') 
        ORDER BY FIRST_LOAD_TIME;
    END IF;
END IF;
IF tabl = 'Medicines' THEN
    IF flag = 1 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('UPDATE Medicines%') --AND TO_CHAR(first_load_time) =  to_char(sysdate, 'yyyy-mm-dd/hh24:mi:ss')
        ORDER BY FIRST_LOAD_TIME asc;
    END IF;
    IF flag = 2 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('INSERT INTO Medicines%')
        ORDER BY FIRST_LOAD_TIME;
    END IF;
    IF flag = 3 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('DELETE FROM Medicines%') 
        ORDER BY FIRST_LOAD_TIME;
    END IF;
END IF;
IF tabl = 'Patience' THEN
    IF flag = 1 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('UPDATE Patience%') --AND TO_CHAR(first_load_time) =  to_char(sysdate, 'yyyy-mm-dd/hh24:mi:ss')
        ORDER BY FIRST_LOAD_TIME asc;
    END IF;
    IF flag = 2 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('INSERT INTO Patience%')
        ORDER BY FIRST_LOAD_TIME;
    END IF;
    IF flag = 3 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('DELETE FROM Patience%') 
        ORDER BY FIRST_LOAD_TIME;
    END IF;
END IF;
IF tabl = 'PRESCRIBED_DIAGNOSIS' THEN
    IF flag = 1 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('UPDATE PRESCRIBED_DIAGNOSIS%') --AND TO_CHAR(first_load_time) =  to_char(sysdate, 'yyyy-mm-dd/hh24:mi:ss')
        ORDER BY FIRST_LOAD_TIME asc;
    END IF;
    IF flag = 2 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('INSERT INTO PRESCRIBED_DIAGNOSIS%')
        ORDER BY FIRST_LOAD_TIME;
    END IF;
    IF flag = 3 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('DELETE FROM PRESCRIBED_DIAGNOSIS%') 
        ORDER BY FIRST_LOAD_TIME;
    END IF;
END IF;
IF tabl = 'course_treatment' THEN
    IF flag = 1 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('UPDATE%course_treatment%') --AND TO_CHAR(first_load_time) =  to_char(sysdate, 'yyyy-mm-dd/hh24:mi:ss')
        ORDER BY FIRST_LOAD_TIME asc;
    END IF;
    IF flag = 2 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('INSERT INTO%course_treatment%')
        ORDER BY FIRST_LOAD_TIME;
    END IF;
    IF flag = 3 THEN 
        select v.SQL_TEXT BULK COLLECT INTO l_mas
        from v$sql v
        where PARSING_SCHEMA_NAME = 'BD_MEDIC'
        AND LOWER (SQL_TEXT) LIKE LOWER ('DELETE FROM%course_treatment%') 
        ORDER BY FIRST_LOAD_TIME;
    END IF;
END IF;
    IF l_mas.count = 0 THEN
    RETURN '0';
    END IF;
    FOR i IN l_mas.FIRST..l_mas.LAST LOOP
        sqltext := l_mas(i).SQLT;
    END LOOP;
RETURN (sqltext);
END;


CREATE TABLE v$sql (SQL_TEXT VARCHAR2 (1000 Byte),
           PARSING_SCHEMA_NAME VARCHAR2 (128 Byte),
           FIRST_LOAD_TIME VARCHAR2 (19 Byte),
           DISK_READS NUMBER,
           ROWS_PROCESSED NUMBER,
           ELAPSED_TIME NUMBER,
           service VARCHAR2 (64 Byte));
INSERT ALL
INTO v$sql
select DISTINCT  v.SQL_TEXT,
           v.PARSING_SCHEMA_NAME,
           v.FIRST_LOAD_TIME,
           v.DISK_READS,
           v.ROWS_PROCESSED,
           v.ELAPSED_TIME,
           v.service
      from SYS.v$sql v;
