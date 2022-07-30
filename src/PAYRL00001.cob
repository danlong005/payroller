      * ================================================================
      * Compile Instructions
      * ----------------------------------------------------------------
      * export COBCPY="/home/dlong/downloads/Open-COBOL-ESQL-1.3/copy"
      *
      * ================================================================
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYRL00001.
       AUTHOR. DLONG.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ERROR-ID    PIC 9(5) VALUE ZEROS.

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME      PIC X(30) VALUE SPACE.
       01  USERNAME    PIC X(30) VALUE SPACE.
       01  PASSWD      PIC X(10) VALUE SPACE.
       EXEC SQL END DECLARE SECTION END-EXEC.

       EXEC SQL INCLUDE SQLCA END-EXEC.
       PROCEDURE DIVISION.
       MAIN.
           MOVE "payroll@172.17.16.1" TO DBNAME.
           MOVE "postgres"          TO USERNAME.
           MOVE "password"          TO PASSWD.

           EXEC SQL 
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
           END-EXEC.
           DISPLAY SQLCODE.
           IF SQLCODE NOT = ZERO 
               COMPUTE ERROR-ID = 1
               PERFORM ERROR-PARA
               PERFORM TERMINATE-PARA
           END-IF.

           PERFORM INITIALIZE-PARA.
           PERFORM PROCESS-PARA.
           PERFORM TERMINATE-PARA.
           
       INITIALIZE-PARA.


       PROCESS-PARA.


       TERMINATE-PARA.
           STOP RUN.

       ERROR-PARA.
           IF ERROR-ID = 1
               DISPLAY "COULD NOT CONNECT TO DB"
           END-IF.

