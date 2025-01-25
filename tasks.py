import os
import shutil

# Dosye Tasks :
if not os.path.exists("tasks"):
    os.makedirs("tasks")


def create_file():
    print("Kreye yon nouvo fichye...")
    filename = input("Antre non fichye a: ")

    # Verifye si non fichye a gen senbòl
    if any(char in filename for char in r"!@#$%^&*()_+\-=,.<>/?"):
        print("Non fichye a pa kapab gen senbòl. Tanpri, eseye yon lòt non.")
        return

    # Kreye fichye a
    filepath = os.path.join("tasks", filename)
    with open(filepath, "w") as f:
        pass
    print(f"Fichye '{filepath}' kreye ak sikse!")


# Edit files
def edit_file():
    print("Edite fichye...")
    filename = input("Antre non fichye a: ")
    os.system(f"nano {filename}")


# Kopie yon dosye
def copy_file():
    print("Kopiere yon dosye...")
    original = input("Antre non dosye orijinal la: ")
    copy = input("Antre non kopi a: ")
    shutil.copy(original, f"task_files/{copy}")
    print(f"Dosye '{original}' kopi nan 'task_files/{copy}' ak siksè!")


# Montre fichye
def show_file():
    filename = input("Antre non dosye a pou montre: ")
    filepath = f"task_files/{filename}"
    if os.path.exists(filepath):
        print(f"Kontni dosye '{filename}':")
        with open(filepath, "r") as f:
            print(f.read())
    else:
        print(f"Erè: Dosye '{filename}' pa egziste.")


# Delete files
def delete_file():
    filename = input("Antre non fichye a: ")
    os.remove(filename)
    print(f"File '{filename}' has been deleted successfully.")


# Montre Menu an
def show_menu():
    while True:
        print("---------- Task Automator Menu ----------")
        print("1. Kreye fichye")
        print("2. Edite fichye")
        print("3. Kopie fichye")
        print("4. Montre fichye")
        print("5. Delete fichye")
        print("6. Quit")

        choice = input("Antre yon nombre (1-6): ")

        if choice.isdigit() and 1 <= int(choice) <= 6:
            if choice == "1":
                create_file()
            elif choice == "2":
                edit_file()
            elif choice == "3":
                copy_file()
            elif choice == "4":
                show_file()
            elif choice == "5":
                delete_file()
            elif choice == "6":
                print("Orevwa!")
                return
                # break  # Sòti nan boucle a epi kite script la
        else:
            print("Opsyon non valid, antre yon nombre (1-6).")


while True:
    show_menu()
    break
