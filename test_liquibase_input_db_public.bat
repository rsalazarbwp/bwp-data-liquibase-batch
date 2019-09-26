set path=%PATH%;C:\Program Files\liquibase

REM ============================================
REM 
REM  This version is taking the database name as a parameter in the cmd line
REM Database must be specifified in %1%
REM ============================================

set database=%1%
set var_url="jdbc:mysql://localhost:3309/%database%"
set var_username=admin
set var_password=**pasword**
set var_changeLogFile="C:\liquibase_baseline\%database%\baseline\baseline.yaml"
set var_output_file=liqui_results_%database%_baseline.txt

REM *These are fixed values
set var_classpath="C:\Users\ramons\.DataGrip2019.1\config\jdbc-drivers\MySQL Connector\J 8\8.0.15\mysql-connector-java-8.0.15.jar"

liquibase --username=%var_username% --password=%var_password%  --classpath=%var_classpath% --url=%var_url%  --changeLogFile=%var_changeLogFile%  update >%var_output_file%

pause

cmd /k

