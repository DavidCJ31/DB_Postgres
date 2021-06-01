setlocal
set /p clave=<clave.ini
set PGPASSWORD=root
dir /b /o-D *.aes > lista1.txt

dir /b /o-d | findstr /v /i "\.txt$" > lista1.txt

set /p bandera1=<lista1.txt
echo %bandera1%

aescrypt.exe -d -p %clave% %bandera1%
dir /b /o:-d *.7z > lista2.txt

set /p bandera2=<lista2.txt
echo %bandera2%
7z e -y %bandera2%

timeout 1

SET /P nombre="Digite el nombre del archivo: "

psql -h localhost -p 5432  -U postgres postgres < %nombre%.sql

endlocal
pause
exit