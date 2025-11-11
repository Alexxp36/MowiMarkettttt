#!/bin/bash

echo "========================================"
echo "  Iniciando servidor Django - MOWI"
echo "========================================"
echo ""

cd "$(dirname "$0")"

echo "Activando entorno virtual..."
source venv/bin/activate

echo ""
echo "Iniciando servidor en http://localhost:8000"
echo ""
echo "IMPORTANTE: Deja esta ventana abierta mientras usas la aplicacion"
echo "Para detener el servidor presiona Ctrl+C"
echo ""
echo "========================================"

python manage.py runserver
