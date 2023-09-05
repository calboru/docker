#!/bin/bash

path="/etc/ssh"
fifoFile="tmp/ssh_fifo"
logpath=/var/log

/usr/sbin/sshd -D -E /var/log/auth.log

/bin/crowdsec-firewall-bouncer -v -c /etc/crowdsec/bouncers/crowdsec-firewall-bouncer.yaml