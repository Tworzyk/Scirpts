#!/bin/bash

Log_dir="/var/log/myscripts"
Days=7


if [ ! -d "$Log_dir" ]; then
       echo "Katalog $Log_dir nie istnieje!"
exit 1
fi


echo "Usuwanie plikow starszych niz $Days dni w $Log_dir:"
find /var/log/myscripts/ -name "*.log" -mtime +"$Days" -print  -exec rm -f {} \;

echo "Usuwanie zakoncznone!"
