@echo off
echo ========================================
echo INSTALACION INICIAL DE DJANGO - MOWI
echo ========================================
echo.
echo Este script instalara todo lo necesario para Django
echo Solo necesitas ejecutarlo UNA VEZ
echo.
pause

cd /d "%~dp0"

echo.
echo [1/5] Verificando Python...
python --version
if errorlevel 1 (
    echo ERROR: Python no esta instalado
    echo Por favor instala Python desde https://www.python.org/downloads/
    pause
    exit /b 1
)

echo.
echo [2/5] Creando entorno virtual...
if not exist venv (
    python -m venv venv
    echo Entorno virtual creado exitosamente
) else (
    echo Entorno virtual ya existe, continuando...
)

echo.
echo [3/5] Activando entorno virtual e instalando dependencias...
call venv\Scripts\activate.bat
pip install -r requirements.txt

echo.
echo [4/5] Creando base de datos...
python manage.py migrate

echo.
echo [5/5] Creando usuario administrador...
python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(email='admin@mowi.com').exists() or User.objects.create_superuser(email='admin@mowi.com', name='Administrador Mowi', password='Admin123!')"

echo.
echo ========================================
echo INSTALACION COMPLETADA EXITOSAMENTE!
echo ========================================
echo.
echo Credenciales del administrador:
echo Email: admin@mowi.com
echo Password: Admin123!
echo.
echo Ahora puedes cerrar esta ventana y hacer doble clic en:
echo iniciar_servidor.bat
echo.
pause
