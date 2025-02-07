#!/bin/bash

index=0
declare -a names

cat users.txt | awk '{print $3}' > usertodel.txt

while read -r name
do
        names[$index]="$name"
        ((index+=1))
done < "usertodel.txt"

for (( i = 0; i < $index; i++ ));
do
        if id "${names[$i]}" &>/dev/null; then
                userdel -r ${names[$i]}
        else
                echo "User ${names[$i]} does not exist."
        fi
done
