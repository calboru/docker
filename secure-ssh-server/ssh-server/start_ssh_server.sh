#!/bin/bash

set -e


/usr/sbin/sshd -D -E /var/log/auth.log &
/bin/crowdsec-firewall-bouncer -v -c /etc/crowdsec/bouncers/crowdsec-firewall-bouncer.yaml