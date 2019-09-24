SET ECHO OFF
REM ============INPUT BY USER====================
REM This version accepts the password as the first parameter, thus using %1%.

set user1=admin
set password1=%1%
set database1=pipelinemodel_diff_test1
set var_url1="jdbc:mysql://localhost:3309/%database1%"


set user2=admin
set password2=%1%
set database2=pipelinemodel_diff_test3
set var_url2="jdbc:mysql://localhost:3309/%database2%"

REM ============fixed values====================
set path=%path%;"C:\Program Files\MySQL\MySQL Workbench 8.0 CE"

REM ========= VARIABLES calculated internally==========
set yyyymmdd=%date:~10,4%%date:~4,2%%date:~7,2%
set error_file=.\%database%\mysql_error_%database1_diff%_%yyyymmdd%.txt
set sql_file=.\%database%\mysql_ddl_%database1%_diff_%yyyymmdd%.sql

REM ========= LIQUIBASE SPECIFICS==========

set driver="C:\Users\ramons\.DataGrip2019.1\config\jdbc-drivers\MySQL Connector\J 8\8.0.15\mysql-connector-java-8.0.15.jar"


set path=%PATH%;C:\Program Files\liquibase


set var_classpath="C:\Users\ramons\.DataGrip2019.1\config\jdbc-drivers\MySQL Connector\J 8\8.0.15\mysql-connector-java-8.0.15.jar"

liquibase --username=%user1% --password=%password1%  --classpath=%var_classpath% --url=%var_url1%   diff   --referenceUsername=%user2% --referencePassword=%password2% --referenceUrl=%var_url2% >diff_output.txt

pause

		