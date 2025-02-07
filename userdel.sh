#!/bin/bash

index=0
declare -a names

cat users.txt | awk '{print $3}' >> usertodel.txt

while read -r name
do
        names[$index]="$name"
        ((index+=1))
done < "usertodel.txt"

for (( i = 0; i < $index; i++ ));
do
        userdel ${names[$i]}
done
echo "Users deleted successfully "
