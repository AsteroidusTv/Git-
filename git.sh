#!/bin/bash

echo "Message for commit : "
read message

echo "Enter branch name (default: main) : "
read branch

# Vérifier si branch est vide, alors utiliser la branche par défaut "main"
if [ -z "$branch" ]
then
    branch="main"
fi

cd /home/achille/Documents/Programation/Html/Cescosite/
git checkout $branch
git add .
git commit -m "$message"
echo $message
git push origin $branch

