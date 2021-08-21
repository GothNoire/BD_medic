CREATE OR REPLACE PROCEDURE copy_from_sys_sqltext
IS
BEGIN
--DELETE FROM bd_medic.v$sql;
INSERT ALL
INTO bd_medic.v$sql
select   v.SQL_TEXT,
           v.PARSING_SCHEMA_NAME,
           v.FIRST_LOAD_TIME,
           v.DISK_READS,
           v.ROWS_PROCESSED,
           v.ELAPSED_TIME,
           v.service
      from SYS.v$sql v
      WHERE 
      FIRST_LOAD_TIME = (SELECT MAX(FIRST_LOAD_TIME) FROM  SYS.v$sql
      WHERE lower (PARSING_SCHEMA_NAME) = lower ('BD_medic') 
      AND (LOWER (SQL_TEXT) LIKE LOWER ('UPDATE%') OR LOWER (sql_text) LIKE LOWER ('INSERT%') OR LOWER (SQL_TEXT) LIKE LOWER ('DELETE%')))
      order by FIRST_LOAD_TIME;
      COMMIT;
END;
