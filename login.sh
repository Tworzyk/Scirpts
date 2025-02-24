#!/bin/bash

ls /var/log/secure* 2>/dev/null || {echo "There is no logs file" ;exit 1}

read -p "Select file that will you open: " file

if [[ -f /var/log/$file ]];then

cat /var/log/$file | grep "Failed password" | awk '{print $9}' | sort | head -n 10 >> logins_attemps.log
else
echo "File doesnt exist "
fi

~
