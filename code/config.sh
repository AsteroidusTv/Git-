# List of folder names to search
directory_list=("Projects" "Project" "project" "projects")
project_response=y
# Counter initialized to zero
counter=0

# Variable to store folder path if found
directory_path=""

# While loop until folder is found and all items in list have been searched
while [[ -z "$directory_path" && $counter -lt ${#directory_list[@]} ]]
do
    # Get the current directory name to search
    current_directory=${directory_list[$counter]}

    # Use the `find` command to search for the folder in the entire computer
    directory_path=$(find /home -type d -name "$current_directory" 2>/dev/null)

    ((counter++))
done

if [[ -n "$directory_path" ]]; then
    echo -n "Is this the folder that contains your projects?: $directory_path, Y/n: "
    read project_response

    if [[ $project_response == "Y" || $project_response == "y" ]]; then
        # Do something if the project folder is found
        echo "Project folder found!"

    elif [[ $project_response == "N" || $project_response == "n" ]]; then
        echo -n "Please enter the path to your projects folder following this pattern \"/home/your/directory/path\": "
        read directory_response
        # Do something else if the project folder is not found
    fi
else
    echo "None of the listed folders were found in the entire computer, or all items in the list were searched."
    echo -n "Please enter the path to your projects folder following this pattern \"/home/your/directory/path\": "
    read directory_response
    # Do something else if no folder is found
fi

echo "directory_path=\"$directory_path\"" >> ./data/git_config.conf