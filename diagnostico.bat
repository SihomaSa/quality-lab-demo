@echo off
REM Script de diagnóstico para Quality Lab Demo en Windows

echo ====================================
echo PASO 1: Verificar estructura
echo ====================================
cd /d %~dp0
if exist "backend" (
    echo [OK] Carpeta backend encontrada
) else (
    echo [ERROR] Carpeta backend NO existe
    pause
    exit /b 1
)

cd backend
echo Contenido de backend:
dir /B

echo.
echo ====================================
echo PASO 2: Buscar pom.xml
echo ====================================
if exist "pom.xml" (
    echo [OK] pom.xml encontrado
    echo Primeras 30 lineas:
    for /f "tokens=*" %%a in ('findstr /N "." pom.xml ^| findstr /R "^[1-9]:" ^| findstr /R "^[1-3][0-9]:"') do echo %%a
) else (
    echo [ERROR] pom.xml NO existe
    pause
    exit /b 1
)

echo.
echo ====================================
echo PASO 3: Estructura de fuentes
echo ====================================
if exist "src\main\java" (
    echo [OK] src\main\java existe
    dir /B src\main\java
) else (
    echo [ALERTA] src\main\java NO existe
)

if exist "src\test\java" (
    echo [OK] src\test\java existe
    dir /B src\test\java
) else (
    echo [ALERTA] src\test\java NO existe
)

echo.
echo ====================================
echo PASO 4: Limpiar y compilar
echo ====================================
echo Ejecutando: mvn clean compile
call mvn clean compile 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Compilacion fallida
    echo Compartir este error completo
    pause
    exit /b 1
)

echo.
echo ====================================
echo PASO 5: Ejecutar tests
echo ====================================
echo Ejecutando: mvn test
call mvn test 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ALERTA] Tests fallaron
    echo Revisar los errores arriba
)

echo.
echo ====================================
echo PASO 6: Generar JaCoCo
echo ====================================
echo Ejecutando: mvn verify
call mvn verify 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ALERTA] Verify fallaron
    echo Revisar los errores arriba
)

echo.
echo ====================================
echo Diagnostico completado
echo ====================================
echo Si hay errores, copialos y comparteios
pause