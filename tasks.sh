#!/bin/bash

# Directory Taks
mkdir -p tasks

create_file(){
  echo "create file... $1"
  read -p "name:" filename
  touch "tasks/$filename"
  echo "Dosye '$filename' kreye ak sikse!"
}

#Edit file
edit_file() {
  echo "edit file... $1"
  read -p "name:" task_name

    # Detekte ekstansyon fichye a
    if [[ "$task_name" == *".sh" ]]; then
        nano "$task_name"
    elif [[ "$task_name" == *".txt" ]]; then
        nano "$task_name"
    elif [[ "$task_name" == *".py" ]]; then
        nano "$task_name.py"
    else
        echo "Ekstansyon pa valid. Tanpri chwazi yon fichye avèk ekstansyon .sh, .txt, oswa .py."
        return
    fi
}

# Kopie yon dosye
copy_file() {
    echo "Kopiere yon dosye..."
    read -p "Antre non dosye orijinal la: " original
    read -p "Antre non kopi a: " copy
    cp "$original" "task_files/$copy"
    echo "Dosye '$original' kopi nan 'task_files/$copy' ak siksè!"
}
# Elimine fichye
delete_file() {
  echo "Elimine yon dosye..."
  read -p "Antre non dosye ou vle elimine a: " filename
  rm -r "tasks/$filename"
  echo "fichye 'tasks/$filename' elimine ak sikse!"
}

show_file() {
    read -p "Antre non dosye a pou montre: " filename
    if [[ -f "task_files/$filename" ]]; then
        echo "Kontni dosye '$filename':"
        cat "task_files/$filename"
    else
        echo "Erè: Dosye '$filename' pa egziste."
    fi
}

# Montre yon menu
show_menu() {
    echo "----- Task Automator Menu -----"
    echo "1. Kreye yon dosye"
    echo "2. Kopie yon dosye"
    echo "3. Edite yon fichye"
    echo "3. Elimine yon dosye"
    echo "4. kite"
    read -p "Chwazi yon opsyon (1-4): " choice

    case $choice in
        1) create_file ;;
        2) copy_file ;;
        3) edit_file ;;
        3) delete_file ;;
        4) echo "Orevwa!" ; exit 0 ;;
        *) echo "Opsyon envalid, tanpri eseye ankò." ;;
    esac
}

# Ekzekite menu an
while true; do
  show_menu
done
