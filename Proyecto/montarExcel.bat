setlocal
SET /P nombreCSV="Digite el nombre del CSV: "
SET /P nombreDB="Digite el nombre de la DB (postgres): "
set PGPASSWORD=root
start psql -h localhost -U postgres -d postgres -p 5432 -e -v v1='\%nombreCSV%.csv' -v v2=%nombreDB% -f montarExcel.sql
endlocal
exit
