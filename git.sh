	 #!/bin/bash

echo "What file"
read file
echo "Message for commit : "
read message
cd change/your/file
git add .
git commit -m "$message" 
echo $message
git push
