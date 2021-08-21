CREATE TABLE Post (Id INTEGER, NamePost VARCHAR2(150 CHAR), UserModified VARCHAR2(250 CHAR), DateModified DATE,
CONSTRAINTS PK_Post_Id PRIMARY KEY (Id));
CREATE TABLE Employees (Id INTEGER, Surname VARCHAR2 (150 CHAR), Name VARCHAR2(150 CHAR), Patronymic VARCHAR2(150 CHAR), Id_Post INTEGER, UserModified VARCHAR2(250 CHAR), DateModified DATE,
CONSTRAINTS PK_Employee_Id PRIMARY KEY (Id),
CONSTRAINTS FK_Employee_Id_Post_Post_Id FOREIGN KEY (Id_Post)
REFERENCES Post (Id));
CREATE TABLE Reference_Diagnosis (Id INTEGER, Name VARCHAR2(150), Description VARCHAR2(500 CHAR), UserModified VARCHAR2(250 CHAR), DateModified DATE,
CONSTRAINTS PK_Reference_Diagnosis_Id PRIMARY KEY (Id));
CREATE TABLE Medicines (Id INTEGER, Name_medicines VARCHAR2 (150 CHAR), Description VARCHAR2(500 CHAR), Id_group INTEGER, Id_diagnosis INTEGER, UserModified VARCHAR2(250 CHAR), DateModified DATE,
CONSTRAINTS PK_Medicines_Id PRIMARY KEY (Id),
CONSTRAINTS FK_Medicines_Id_group_Medicines_Id FOREIGN KEY (Id_group)
REFERENCES Medicines (Id),
CONSTRAINTS FK_Medicines_Id_Diagnosis_Reference_Diagnosis_Id FOREIGN KEY (Id_diagnosis)
REFERENCES Reference_Diagnosis (Id));
CREATE TABLE Patience (Id INTEGER, Surname VARCHAR2 (150 CHAR), Name VARCHAR2(150 CHAR), Patronymic VARCHAR2(150 CHAR), Id_employee INTEGER, UserModified VARCHAR2(250 CHAR), DateModified DATE,
CONSTRAINTS PK_Patience_Id PRIMARY KEY (Id),
CONSTRAINTS FK_Patience_Id_employee_Employees_Id FOREIGN KEY (Id_employee)
REFERENCES Employees (Id));
CREATE TABLE Prescribed_diagnosis (Id INTEGER, Id_diagnosis INTEGER, Id_Patience INTEGER, UserModified VARCHAR2(250 CHAR), DateModified DATE,
CONSTRAINTS PK_Prescribed_diagnosis_Id PRIMARY KEY (Id),
CONSTRAINTS FK_Prescribed_diagnosis_Id_diagnosis_Reference_Diagnosis_Id FOREIGN KEY (Id_diagnosis)
REFERENCES Reference_Diagnosis (Id),
CONSTRAINTS FK_Prescribed_diagnosis_Id_Patience_Patience_Id FOREIGN KEY (Id_Patience)
REFERENCES Patience (Id));
CREATE TABLE Course_treatment (Id INTEGER, Time INTEGER, Description VARCHAR2(500 CHAR), UserModified VARCHAR2(250 CHAR), DateModified DATE,
CONSTRAINTS PK_Course_treatment_Id PRIMARY KEY (Id),
CONSTRAINTS FK_Course_treatment_Id_Prescribed_diagnosis_Id FOREIGN KEY (Id)
REFERENCES Prescribed_diagnosis (Id));


DROP TABLE protocol;
CREATE TABLE Protocol (Id INTEGER, action VARCHAR2(150 CHAR), tab VARCHAR2(150 CHAR), text_action CLOB, Date_action DATE, User_action VARCHAR2(200 CHAR));

