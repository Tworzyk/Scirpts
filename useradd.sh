#!/bin/bash

read -p "Podaj nazwe uzytkownika: " uzytkownik
read -p "Chcesz dodac haslo ? Tak/Nie? " haslo

useradd -m -U $uzytkownik

if [[ $haslo == "Tak" || $haslo == "TAK" ]];then
        read -s -p "Podaj haslo: " haslo1
        echo
        read -s -p "Potwierdz haslo: " haslo2
        echo

        if [[ "$haslo1" != "$haslo2" ]]; then
                echo "Haslo sie nie zgadzaja"
                exit 1
        fi

        echo $haslo1 | passwd --stdin $uzytkownik

fi
if [[ $? -ne 0 ]]; then
        echo "Blad podczas dodawania uzytkownika"
        exit 1
fi


echo "Uzytkownik dodany "
cat /etc/passwd | grep "^$uzytkownik"
