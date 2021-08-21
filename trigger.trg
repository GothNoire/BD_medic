CREATE OR REPLACE TRIGGER Bd_medic.IU_Post
BEFORE 
INSERT OR UPDATE ON Bd_medic.Post
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      IF NVL(:NEW.Id, 0) = 0 THEN
        :NEW.Id := Bd_medic.Post_Id.nextval;
      END IF;
   END IF;
    :NEW.UserModified := USER;
    :NEW.DateModified := SYSDATE;     
END;

CREATE OR REPLACE TRIGGER Bd_medic.IU_Employees
BEFORE 
INSERT OR UPDATE ON Bd_medic.Employees
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      IF NVL(:NEW.Id, 0) = 0 THEN
        :NEW.Id := Bd_medic.Employees_Id.nextval;
      END IF;
   END IF;
   -- :NEW.UserModified := USER;
    --:NEW.DateModified := SYSDATE;     
END;

CREATE OR REPLACE TRIGGER Bd_medic.IU_Reference_Diagnosis
BEFORE 
INSERT OR UPDATE ON Bd_medic.Reference_Diagnosis
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      IF NVL(:NEW.Id, 0) = 0 THEN
        :NEW.Id := Bd_medic.Reference_Diagnosis_Id.nextval;
      END IF;
   END IF;
    :NEW.UserModified := USER;
    :NEW.DateModified := SYSDATE;     
END;

CREATE OR REPLACE TRIGGER Bd_medic.IU_Medicines
BEFORE 
INSERT OR UPDATE ON Bd_medic.Medicines
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      IF NVL(:NEW.Id, 0) = 0 THEN
        :NEW.Id := Bd_medic.Medicines_Id.nextval;
      END IF;
   END IF;
    :NEW.UserModified := USER;
    :NEW.DateModified := SYSDATE;     
END;

CREATE OR REPLACE TRIGGER Bd_medic.IU_Patience
BEFORE 
INSERT OR UPDATE ON Bd_medic.Patience
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      IF NVL(:NEW.Id, 0) = 0 THEN
        :NEW.Id := Bd_medic.Patience_Id.nextval;
      END IF;
   END IF;
    :NEW.UserModified := USER;
    :NEW.DateModified := SYSDATE;     
END;

CREATE OR REPLACE TRIGGER Bd_medic.IU_Prescribed_diagnosis
BEFORE 
INSERT OR UPDATE ON Bd_medic.Prescribed_diagnosis
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      IF NVL(:NEW.Id, 0) = 0 THEN
        :NEW.Id := Bd_medic.Prescribed_diagnosis_Id.nextval;
      END IF;
   END IF;
    --:NEW.UserModified := USER;
    --:NEW.DateModified := SYSDATE;     
END;

CREATE OR REPLACE TRIGGER Bd_medic.IU_Course_treatment
BEFORE 
INSERT OR UPDATE ON Bd_medic.Course_treatment
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      IF NVL(:NEW.Id, 0) = 0 THEN
        :NEW.Id := Bd_medic.Course_treatment_Id.nextval;
      END IF;
   END IF;
    :NEW.UserModified := USER;
    :NEW.DateModified := SYSDATE;     
END;

CREATE OR REPLACE TRIGGER Bd_medic.IU_Protocol
BEFORE 
INSERT OR UPDATE ON Bd_medic.Protocol
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      --IF NVL(:NEW.Id, 0) = 0 THEN
        :NEW.Id := Bd_medic.Protocol_Id.nextval;
     -- END IF;
   END IF;
   -- :NEW.UserModified := USER;
   -- :NEW.DateModified := SYSDATE;     
END;
