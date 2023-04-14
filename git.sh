#!/bin/bash

echo "Message for commit : "
read message

echo "Enter branch name (default: master) : "
read branch


if [ -z "$branch" ]
then
    branch="master"
fi

cd /home/achille/Documents/Programation/Html/Cescosite/
git checkout $branch
git add .
git commit -m "$message"
echo $message
git push origin $branch

