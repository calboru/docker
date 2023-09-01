FROM ubuntu:latest

RUN mkdir -p /var/run/sshd

RUN apt update && \
    apt install -y openssh-server && \
    apt install -y fail2ban && \
    mkdir /var/run/fail2ban && \
    cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults && \
    chmod a-w /etc/ssh/sshd_config.factory-defaults && \
    touch /var/log/auth.log

COPY jail.local /etc/fail2ban/jail.local

COPY sshd_config /etc/ssh

RUN useradd -rm -d /home/sshu1 -s /bin/bash sshu1 && \
    echo sshu1:%01gZfc2xOwj9iRC | chpasswd

RUN mkdir /home/sshu1/.ssh && \
    chmod 700 /home/sshu1/.ssh  

COPY id_rsa_for_sshu1.pub /home/sshu1/.ssh/authorized_keys
RUN chown sshu1:sshu1 -R /home/sshu1/.ssh && \
    chmod 600 /home/sshu1/.ssh/authorized_keys

RUN mkdir -p /data/uploads && \
    chmod 755 /data && \
    chown root:root /data && \
    chmod 777 /data/uploads

CMD   rm -f /var/run/fail2ban/* && service fail2ban start && /usr/sbin/sshd -D -E /var/log/auth.log

#BEFORE BUILD THE CONTAINER CREATE SSH KEY
#ssh-keygen -b 4096 -f id_rsa_for_sshu1

#INSPECT
#sudo docker logs --tail 50 --follow --timestamps ssh-server