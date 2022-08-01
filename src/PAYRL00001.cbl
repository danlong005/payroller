      * ================================================================
      * PAYRL00001 - Create gross pay records for each employee
      *
      * ================================================================

       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYRL00001.
       AUTHOR. DLONG.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  HOURLY     PIC X(1) VALUE 'H'.

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
           PERFORM ERROR-HANDLING.

           PERFORM INIT.
           PERFORM DOWORK.
           PERFORM TERM.



       INIT.
           EXEC SQL DECLARE EMPS-CSR CURSOR FOR
               SELECT ID, PAY_TYPE, SALARY, RATE   
               FROM EMPLOYEE_DETAILS
           END-EXEC.
           
           EXEC SQL OPEN EMPS-CSR END-EXEC.
           PERFORM ERROR-HANDLING.



       DOWORK.
           EXEC SQL 
               FETCH EMPS-CSR INTO :ID, :PAY_TYPE, :SALARY, :RATE 
           END-EXEC.
           
           PERFORM UNTIL SQLCODE NOT = ZERO  
               IF PAY_TYPE = HOURLY
                   PERFORM SUM-HOURS
                   PERFORM CALC-HOURLY-GROSS
               ELSE
                   PERFORM CALC-SALARY-GROSS
               END-IF
               PERFORM CREATE-GROSS
           END-PERFORM.

           EXEC SQL 
               FETCH EMPS-CSR INTO :ID, :PAY_TYPE, :SALARY, :RATE   
           END-EXEC.
           .



       TERM.
           EXEC SQL CLOSE EMPS-CSR END-EXEC.
           PERFORM ERROR-HANDLING.

           EXEC SQL COMMIT WORK END-EXEC.
           PERFORM ERROR-HANDLING.

           EXEC SQL DISCONNECT ALL END-EXEC.
           STOP RUN.



       ERROR-HANDLING.
           IF SQLCODE NOT = ZERO 
               DISPLAY "SQLCODE: " SQLCODE " "
               PERFORM TERM
           END-IF.



       CALC-HOURLY-GROSS.



       CALC-SALARY-GROSS.


       SUM-HOURS.



       CREATE-GROSS.

