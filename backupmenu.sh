#!/bin/bash

while [ true ]
do
        echo "1.Do /home/$whoami folder backup "
        echo ""
        echo "2.Do only text file backup"
        echo ""
        echo "3.Open a backup"
        echo ""
        echo "4.Exit"

        read choise

        case $choise in
                1)
                        if [[ ! -d "/home/$(whoami)/backup" ]]; then
                                mkdir -p /home/$(whoami)/backup/
                        fi

                        tar -cvf /home/$(whoami)/backup/backup_$(date +%F-%H-%M-%S).tar --exclude="/home/$(whoami)/backup" /home/$(whoami)/
                        ;;
                2) tar -cvf /home/$(whoami)/backup/backup_txt_$(date +%F-%H-%M-%S).tar --exclude="/home/$(whoami)/backup" /home/$(whoami)/*.txt
                        ;;
                3)
                        while [ true ]
                        do
                                ls -l  /home/$(whoami)/backup
                                echo "Write which file will you open "
                                read file
                                if [  -f "/home/$(whoami)/backup/$file" ]; then
                                echo "File opened successfull"
                                tar -xvf /home/$(whoami)/backup/$file -C "/home/$(whoami)"
                                exit 1
                        else
                                echo "File dosent exist"
                                fi

                        done
                        ;;
                4)
                        exit 1
                        ;;
                *)
                        echo "Invalid Option"
                        ;;
        esac

done
