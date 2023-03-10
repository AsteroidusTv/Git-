	 #!/bin/bash


echo "Message for commit : "
read message
cd /home/achille/Documents/Projects/Html/Cescosite/
git add .
git commit -m "$message" 
echo $message
git push
