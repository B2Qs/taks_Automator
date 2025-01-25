#!/bin/bash

# Fonksyon pou montre menu prensipal la
show_main_menu() {
    echo "----- Task Automator Menu -----"
    echo "1. Itilize script Bash (tasks.sh)"
    echo "2. Itilize script Python (tasks.py)"
    echo "3. kite"
    read -p "Chwazi yon opsyon (1-3): " choice

    case $choice in
        1) ./tasks.sh ;;  # Ekzekite script Bash
        2) python3 tasks.py ;;  # Ekzekite script Python
        3) echo "Orevwa!" ; exit 0 ;;
        *) echo "Opsyon envalid, tanpri eseye ankò." ;;
    esac
}

# Boucle prensipal la
while true; do
    show_main_menu
done
