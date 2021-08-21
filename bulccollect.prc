DECLARE 
TYPE r_person IS RECORD (
 surname VARCHAR2(250 CHAR),
 name VARCHAR2(250 CHAR),
 type VARCHAR2 (100 CHAR)
);
TYPE t_mas IS TABLE OF r_person INDEX BY PLS_INTEGER;
l_tab t_mas;
line CLOB; 
lines CLOB; 
BEGIN
 SET TRANSACTION READ ONLY;
 SELECT surname, name, 'Doctor' BULK COLLECT INTO l_tab
 FROM EMPLOYEES
 UNION
 SELECT surname, name, 'Patience'
 FROM patience;
 FOR i IN l_tab.FIRST..l_tab.LAST
   LOOP
    line:= l_tab(i).surname || ' ' || l_tab(i).name || ' ' || l_tab(i).type; 
    DBMS_OUTPUT.PUT_LINE (line);
    lines := CONCAT (CONCAT (lines, ' '), line);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE (Count_words(lines));
 COMMIT;
END;