#!/bin/bash

path="/etc/ssh"
fifoFile="$path/ssh_fifo"
logpath=/var/log

/usr/sbin/sshd -D  2>&1 -dd | while read line; do printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$line"; done

# echo 'RUNNING SSHD SERVER'
# /usr/sbin/sshd -D -f /etc/ssh/sshd_config -E /etc/ssh/ssh_fifo

# echo 'EXECUTING THE FIFO LOOP'

# ## Check if pipe exists or fail
# if [[ ! -p $fifoFile ]];then
#    echo 'CREATING FIFO FILE BECAUSE NOT FOUND'
#    mkfifo $fifoFile
#    [[ ! -p $fifoFile ]] && echo "ERROR: Failed to create FIFO file" && exit 1
# fi

# ## Monitor the FIFO file and store the SSHD logs
# while true
# do
#     if read line; then
#        echo '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$line"
#        printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$line" >> "$path/sshd_debug.log"
#     fi
# done <"$fifoFile"
