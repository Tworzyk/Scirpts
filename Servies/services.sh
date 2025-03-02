  #!/bin/bash

read -p "Write down name of services you want to check: " service

status=$(systemctl is-active  $service 2>/dev/null)


if [[ -z $status  ]];then
  echo "Service $service dose not exist!"
  exit 1
fi

if [[ $status != "active" ]];then
    echo "Starting service $service"
    systemctl start $service
    new_status=$(systemctl is-active $service)
    if [[ $new_status == "active" ]];then
    systemctl status $service >> service.log
    else
    echo "Service $service is faild"
    fi
  else
  echo "Service $service is running"
fi

~
~
