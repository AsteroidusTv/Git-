config_file="./data/git_config.conf"
directory_path=$(grep "directory_path" "$config_file" | cut -d'=' -f2 | tr -d ' ' | tr -d '"')
cd "$directory_path"

folder_exists=false
while [ "$folder_exists" = false ]; do
  read -p "Enter a folder name: " folder_name
  if [ -d "$folder_name" ]; then
    echo "Folder exists."
    cd "$folder_name"
    folder_exists=true
  else
    choice="r"
    read -p "Folder does not exist. Do you want to enter another name or cancel? (Retry [r]/Cancel [c]) " choice
    case "$choice" in
      r|R|Retry)
        continue
        ;;
      c|C|Cancel)
        echo "Operation cancelled. No folder selected."
        exit 0
        ;;
      *)
        echo "Invalid choice."
        ;;
    esac
  fi
done
pwd
project_exists=false
while [ "$project_exists" = false ]; do
  read -p "Enter a project name: " project_name
  if [ -d "$project_name" ]; then
    echo "Project exists."
    cd "$project_name"
    project_exists=true
  else
    choice="r"
    read -p "Project does not exist. Do you want to enter another name or cancel? (Retry [r]/Cancel [c]) " choice
    case "$choice" in
      r|R|Retry)
        continue
        ;;
      c|C|Cancel)
        echo "Operation cancelled. No folder selected."
        exit 0
        ;;
      *)
        echo "Invalid choice."
        ;;
    esac
  fi
done
pwd
read -p "What message to commit: " commit_message
git add .
git commit -m "$commit_message"
git push
