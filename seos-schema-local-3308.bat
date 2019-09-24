SET ECHO OFF
REM ============INPUT BY USER====================
set database=%1%
set password=%2%

REM ============fixed values====================
set path=%path%;"C:\Program Files\MySQL\MySQL Workbench 8.0 CE"
set user=admin
set port=3308

REM ========= VARIABLES calculated internally==========
set yyyymmdd=%date:~10,4%%date:~4,2%%date:~7,2%
set error_file=.\%database%\mysql_error_%database%_%yyyymmdd%.txt
set sql_file=.\%database%\mysql_ddl_%database%_%yyyymmdd%.sql

mysqldump --host=localhost --port=3308 --databases %database% --user=admin --password=%password%  --force --lock-all-tables=FALSE   --skip-add-drop-table  --result-file=%sql_file% --log-error=%error_file% --skip-column-statistics --no-data --skip-quote-names  --skip-quote-names --no-data=true  --dump-date --lock-all-tables=FALSE   --routines=false --skip-add-drop-table  


