#!/bin/bash
index=0;
declare -a names surnames nickes passwords dates
while IFS=' '   read -r  name surname nick password date;
do

        names[$index]="$name"
        surnames[$index]="$surname"
        nickes[$index]="$nick"
        passwords[$index]="$password"
        dates[$index]="$date"
        ((index+=1))
done < "users.txt"
i=0
for (( i; i < $index; i++ ))
do
 useradd ${nickes[$i]} -e ${dates[$i]} -c "${names[$i]} ${surnames[$i]}" -p ${passwords[$i]}
done
echo "Useres add successfully"
