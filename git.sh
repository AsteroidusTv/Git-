	 #!/bin/bash

echo "What file"
read file
echo "Message for commit : "
read message
cd /home/achille/Documents/Projects/Html/$file/
git add .
git commit -m "$message" 
echo $message
git push
