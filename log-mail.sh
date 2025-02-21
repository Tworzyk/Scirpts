#!/bin/bash

#for this script, you have to install cron to schedule this script for every 1H

email="admin@example.com"
hard_drive=$(df -h | sort | head -n 1)
usage=$(df -h | grep ^"$hard_drive" | awk '{print $5}' | tr -d "%" )


if [[ $usage -gt 80 ]];then
echo -e "Space in hard drive is goignt to end soon! $Usage% of $hard_drive \n " | mail -s "Hard Drive $usage%" "$email"
fi
~
~
~
~
