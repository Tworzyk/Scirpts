#!/bin/bash


while true;
do
        echo  "%CPU %MEM %ARGS $(date +%Y_%m_%d_%H_%M_%S)" > ps.log

        ps -e -o pcpu,pmem,args --sort=pcpu | cut -d " " -f1-5 | tail >> ps.log

        sleep 10 ;
done
