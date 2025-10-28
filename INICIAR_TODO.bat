@echo off
echo ========================================
echo    INICIANDO PROYECTO MOWI MARKET
echo ========================================
echo.
echo Este script abrira 2 ventanas:
echo 1. Servidor Django (Backend)
echo 2. Aplicacion React (Frontend)
echo.
echo IMPORTANTE: NO CIERRES NINGUNA VENTANA
echo.
pause

cd /d "%~dp0"

echo Iniciando Django...
start "MOWI - Django Backend" cmd /k "cd server\django_api && venv\Scripts\activate && python manage.py runserver"

timeout /t 3 /nobreak > nul

echo Iniciando React...
start "MOWI - React Frontend" cmd /k "cd client\react-client && npm start"

echo.
echo ========================================
echo  Servidores iniciados exitosamente!
echo ========================================
echo.
echo Django: http://localhost:8000
echo React:  http://localhost:3000
echo.
echo Para detener todo, cierra ambas ventanas
echo.
pause
