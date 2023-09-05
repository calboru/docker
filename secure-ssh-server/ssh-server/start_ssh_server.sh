#!/bin/bash

path="/etc/ssh"
fifoFile="$path/ssh_fifo"
logpath=/var/log

/usr/sbin/sshd -D -f /etc/ssh/sshd_config -E /var/log/auth.log

#/usr/sbin/sshd -D -f /etc/ssh/sshd_config -E /etc/ssh/ssh_fifo


# ## Check if pipe exists or fail
# if [[ ! -p $fifoFile ]];then
#    mkfifo $fifoFile
#    [[ ! -p $fifoFile ]] && echo "ERROR: Failed to create FIFO file" && exit 1
# fi

# ## Monitor the FIFO file and store the SSHD logs
# while true
# do
#     if read line; then
#        printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$line" >> "$logpath/sshd_with_timestamp.log"
#     fi
# done <"$fifoFile"

