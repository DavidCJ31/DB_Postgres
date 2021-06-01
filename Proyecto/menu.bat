REM Relizado por:
REM David Cordero Jimenez
REM Carlos Zhou zheng
REM José Andres Martinez Sarmiento
REM David Vargas Mejia
REM Curso de Administracion de bases de datos, Canal 3, 8 pm.
REM Profe: Manuel Espinoza Guerrero

@ECHO off
cls
:Optstart
cls
ECHO 1. Crear DB
ECHO 2. Crear Tabla
ECHO 3. Montar un archivo de Excel
ECHO 4. Export de la DB
ECHO 5. Import de la DB
ECHO 0. Salir

set choice=
set /p choice=Indique la opcion correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptCrearDB
if '%choice%'=='2' goto OptCreaTabla
if '%choice%'=='3' goto OptMontarExcel
if '%choice%'=='4' goto OptExport
if '%choice%'=='5' goto OptImport
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto Optstart

:OptCrearDB
start crearDB.bat
goto Optstart

:OptCreaTabla
start crearTabla.bat
goto Optstart

:OptMontarExcel
start montarExcel.bat
goto Optstart

:OptExport
start Export.bat
goto Optstart

:OptImport
start Import.bat
goto Optstart

:OptSalir
ECHO Sale del programa
goto Optend

:Optend