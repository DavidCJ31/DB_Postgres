setlocal
SET /P nombre="Digite el nombre de la tabla: "
set PGPASSWORD=root
echo %nombre%
start psql -h localhost -U postgres -d postgres -p 5432 -e -v v1=%nombre% -f crearTabla.sql
endlocal
exit