#!/bin/bash

echo "========================================"
echo " INSTALACION INICIAL DE DJANGO - MOWI"
echo "========================================"
echo ""
echo "Este script instalara todo lo necesario para Django"
echo "Solo necesitas ejecutarlo UNA VEZ"
echo ""
read -p "Presiona Enter para continuar..."

cd "$(dirname "$0")"

echo ""
echo "[1/6] Verificando Python..."
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python no esta instalado"
    echo "Por favor instala Python desde https://www.python.org/downloads/"
    exit 1
fi
python3 --version

echo ""
echo "[2/6] Creando entorno virtual..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "Entorno virtual creado exitosamente"
else
    echo "Entorno virtual ya existe, continuando..."
fi

echo ""
echo "[3/6] Activando entorno virtual e instalando dependencias..."
source venv/bin/activate
pip install -r requirements.txt

echo ""
echo "[4/6] Creando base de datos..."
python manage.py migrate

echo ""
echo "[5/6] Creando usuario administrador..."
python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(email='admin@mowi.com').exists() or User.objects.create_superuser(email='admin@mowi.com', name='Administrador Mowi', password='Admin123!')"

echo ""
echo "[6/6] Verificando instalacion..."
python manage.py check

echo ""
echo "========================================"
echo " INSTALACION COMPLETADA EXITOSAMENTE!"
echo "========================================"
echo ""
echo "Credenciales del administrador:"
echo "Email: admin@mowi.com"
echo "Password: Admin123!"
echo ""
echo "Ahora puedes ejecutar:"
echo "./iniciar_servidor.sh"
echo ""
read -p "Presiona Enter para cerrar..."
