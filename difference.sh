#!/bin/bash

read -p "Write first folder location: " location1
read -p "Write second folder location: " location2


if [[ ! -d "$location1"  || ! -d  "$location2" ]]; then
        echo "Given Location doesnt exist"
        exit 1
fi
 diff -qr "$location1" "$location2"
~
~
