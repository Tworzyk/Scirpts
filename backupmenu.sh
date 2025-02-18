#!/bin/bash

user=$(whoami)
backup_dir="/home/${user}/backup"


while [ true ]
do
        echo ""
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
                        if [[ ! -d "$backup_dir" ]]; then
                                mkdir -p $backup_dir
                        fi

                        tar -cvf $backup_dir/backup_$(date +%F-%H-%M-%S).tar --exclude="$backup_dir" /home/$(whoami)/
                        ;;
                2) tar -cvf $backup_dir/backup_txt_$(date +%F-%H-%M-%S).tar --exclude="$backup_dir" /home/$(whoami)/*.txt
                        ;;
                3)
                        while [ true ]
                        do
                                ls -l  $backup_dir
                                echo "Write which file will you open "
                                read file
                                if [  -f "$backup_dir/$file" ]; then
                                echo "File opened successfull"
                                tar -xvf $backup_dir/$file -C "/home/$(whoami)"
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
