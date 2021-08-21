
CREATE OR REPLACE TRIGGER Bd_medic.protocol_employees
AFTER
INSERT OR UPDATE OR DELETE ON BD_MEDIC.EMPLOYEES
--FOR EACH ROW
DECLARE PRAGMA autonomous_transaction;
s CLOB;
BEGIN
    IF UPDATING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(1, 'Employees');
        INSERT INTO Protocol (action, tab, text_action, Date_action, User_action) VALUES ('UPDATE', 'BD_MEDIC.EMPLOYEES', S, SYSDATE, USER);
    END IF;
    IF INSERTING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(2,'Employees');
        INSERT INTO Protocol (action, tab, text_action, Date_action, User_action) VALUES ('INSERT', 'BD_MEDIC.EMPLOYEES',s, SYSDATE, USER);
    END IF;
    IF DELETING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(3,'Employees');
        INSERT INTO Protocol (action, tab, text_action, Date_action, User_action) VALUES ('DELETE','BD_MEDIC.EMPLOYEES',s, SYSDATE, USER);
    END IF;
    COMMIT;
END;

CREATE OR REPLACE TRIGGER Bd_medic.protocol_Post
AFTER
INSERT OR UPDATE OR DELETE ON BD_MEDIC.Post
--FOR EACH ROW
DECLARE PRAGMA autonomous_transaction;
s CLOB;
BEGIN
    IF UPDATING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(1, 'Post');
        INSERT INTO Protocol (action, tab,text_action, Date_action, User_action) VALUES ('UPDATE', 'BD_MEDIC.Post',s, SYSDATE, USER);
    END IF;
    IF INSERTING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(2, 'Post');
        INSERT INTO Protocol (action, tab,text_action, Date_action, User_action) VALUES ('INSERT', 'BD_MEDIC.Post',s, SYSDATE, USER);
    END IF;
    IF DELETING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(3, 'Post');
        INSERT INTO Protocol (action, tab,text_action, Date_action, User_action) VALUES ('DELETE','BD_MEDIC.Post',s, SYSDATE, USER);
    END IF;
    COMMIT;
END;

CREATE OR REPLACE TRIGGER Bd_medic.protocol_Reference_Diagnosis
AFTER
INSERT OR UPDATE OR DELETE ON BD_MEDIC.Reference_Diagnosis
--FOR EACH ROW
DECLARE PRAGMA autonomous_transaction;
s CLOB;
BEGIN
    IF UPDATING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(1, 'Reference_Diagnosis');
        INSERT INTO Protocol (action, tab,text_action, Date_action, User_action) VALUES ('UPDATE', 'BD_MEDIC.Reference_Diagnosis', s,SYSDATE, USER);
    END IF;
    IF INSERTING THEN
            sys.copy_from_sys_sqltext;
        S := sql_text(2, 'Reference_Diagnosis');
        INSERT INTO Protocol (action, tab,text_action, Date_action, User_action) VALUES ('INSERT', 'BD_MEDIC.Reference_Diagnosis',s, SYSDATE, USER);
    END IF;
    IF DELETING THEN
            sys.copy_from_sys_sqltext;
        S := sql_text(3, 'Reference_Diagnosis');
        INSERT INTO Protocol (action, tab, text_action,Date_action, User_action) VALUES ('DELETE','BD_MEDIC.Reference_Diagnosis',s, SYSDATE, USER);
    END IF;
    COMMIT;
END;

CREATE OR REPLACE TRIGGER Bd_medic.protocol_Medicines
AFTER
INSERT OR UPDATE OR DELETE ON BD_MEDIC.Medicines
--FOR EACH ROW
DECLARE PRAGMA autonomous_transaction;
s CLOB;
BEGIN
    IF UPDATING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(1, 'Medicines');
        INSERT INTO Protocol (action, tab, text_action, Date_action, User_action) VALUES ('UPDATE', 'BD_MEDIC.Medicines',s, SYSDATE, USER);
    END IF;
    IF INSERTING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(2, 'Medicines');
        INSERT INTO Protocol (action, tab, text_action, Date_action, User_action) VALUES ('INSERT', 'BD_MEDIC.Medicines',s, SYSDATE, USER);
    END IF;
    IF DELETING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(3, 'Medicines');
        INSERT INTO Protocol (action, tab, text_action, Date_action, User_action) VALUES ('DELETE','BD_MEDIC.Medicines', s, SYSDATE, USER);
    END IF;
    COMMIT;
END;

CREATE OR REPLACE TRIGGER Bd_medic.protocol_Patience
AFTER
INSERT OR UPDATE OR DELETE ON BD_MEDIC.Patience
--FOR EACH ROW
DECLARE PRAGMA autonomous_transaction;
s CLOB;
BEGIN
    IF UPDATING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(1, 'Patience');
        INSERT INTO Protocol (action, tab,text_action, Date_action, User_action) VALUES ('UPDATE', 'BD_MEDIC.Patience', s,SYSDATE, USER);
    END IF;
    IF INSERTING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(2, 'Patience');
        INSERT INTO Protocol (action, tab, text_action,Date_action, User_action) VALUES ('INSERT', 'BD_MEDIC.Patience',s, SYSDATE, USER);
    END IF;
    IF DELETING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(3, 'Patience');
        INSERT INTO Protocol (action, tab, text_action,Date_action, User_action) VALUES ('DELETE','BD_MEDIC.Patience',s, SYSDATE, USER);
    END IF;
    COMMIT;
END;

CREATE OR REPLACE TRIGGER Bd_medic.protocol_Prescribed_diagnosis
AFTER
INSERT OR UPDATE OR DELETE ON BD_MEDIC.Prescribed_diagnosis
--FOR EACH ROW
DECLARE PRAGMA autonomous_transaction;
s CLOB;
BEGIN
    IF UPDATING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(1, 'PRESCRIBED_DIAGNOSIS');
        INSERT INTO Protocol (action, tab,text_action, Date_action, User_action) VALUES ('UPDATE', 'BD_MEDIC.Prescribed_diagnosis', s, SYSDATE, USER);
    END IF;
    IF INSERTING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(2, 'PRESCRIBED_DIAGNOSIS');
        INSERT INTO Protocol (action, tab, text_action,Date_action, User_action) VALUES ('INSERT', 'BD_MEDIC.Prescribed_diagnosis',s, SYSDATE, USER);
    END IF;
    IF DELETING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(3, 'PRESCRIBED_DIAGNOSIS');
        INSERT INTO Protocol (action, tab, text_action,Date_action, User_action) VALUES ('DELETE','BD_MEDIC.Prescribed_diagnosis', s,SYSDATE, USER);
    END IF;
    COMMIT;
END;

CREATE OR REPLACE TRIGGER Bd_medic.protocol_Course_treatment
AFTER
INSERT OR UPDATE OR DELETE ON BD_MEDIC.Course_treatment
--FOR EACH ROW
DECLARE PRAGMA autonomous_transaction;
s CLOB;
BEGIN
    IF UPDATING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(1, 'course_treatment');
        INSERT INTO Protocol (action, tab, text_action,Date_action, User_action) VALUES ('UPDATE', 'BD_MEDIC.Course_treatment',s, SYSDATE, USER);
    END IF;
    IF INSERTING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(2, 'course_treatment');
        INSERT INTO Protocol (action, tab,text_action, Date_action, User_action) VALUES ('INSERT', 'BD_MEDIC.Course_treatment', s,SYSDATE, USER);
    END IF;
    IF DELETING THEN
        sys.copy_from_sys_sqltext;
        S := sql_text(3, 'course_treatment');
        INSERT INTO Protocol (action, tab, text_action,Date_action, User_action) VALUES ('DELETE','BD_MEDIC.Course_treatment', s,SYSDATE, USER);
    END IF;
    COMMIT;
END;