#!/bin/bash

# Variables
file="/data/git_config.conf"
app_dir="$HOME/.local/share/applications"
git_dir="git.desktop"


if [ -s "$file" ]; then
    # Execute create.sh
    ./code/commit.sh

else
    # Make executable all 
    chmod +x "./code/config.sh" "./code/commit.sh" "git.desktop"
    # Move the new-project directory to /Desktop
    mv "$git_dir" "$app_dir/"
    # Execute confing.sh and create.sh
    ./code/config.sh
    ./code/commit.sh
fi