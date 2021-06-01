@ECHO off
cls
set /p clave=<clave.ini
:Optstart
cls
ECHO 1. Comprimir
ECHO 2. Encriptar
ECHO 3. Namedate
ECHO 0. Salir

set choice=
set /p choice=Indique la opcion correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptComprimir
if '%choice%'=='2' goto OptEncriptar
if '%choice%'=='3' goto OptNamedate
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto Optstart

:OptComprimir
setlocal
SET /P nombre="Digite el nombre del archivo a comprimir: "
set PGPASSWORD=root

pg_dumpall -U postgres > %nombre%.sql
7z a %nombre%.7z %nombre%.sql
del %nombre%.sql 1>nul 2 >nul

endlocal
goto Optstart

:OptEncriptar
setlocal
SET /P nombre="Digite el nombre del archivo a encriptar: "
set PGPASSWORD=root

pg_dumpall -U postgres > %nombre%.sql
7z a %nombre%.7z %nombre%.sql
aescrypt.exe -e -p %clave% %nombre%.7z
del %nombre%.sql 1>nul 2 >nul
del %nombre%.7z 1>nul 2 >nul

endlocal
goto Optstart

:OptNamedate
setlocal
SET /P nombre="Digite el nombre del archivo a encriptar: "
set PGPASSWORD=root

pg_dumpall -U postgres > %nombre%.sql
7z a %nombre%.7z %nombre%.sql
aescrypt.exe -e -p %clave% %nombre%.7z
namedate.exe -Y -ZZ:"(F)Y-m-d(H-M-S).X" %nombre%.7z.aes
del %nombre%.sql 1>nul 2 >nul
del %nombre%.7z 1>nul 2 >nul

endlocal
goto Optstart

:OptSalir
exit
