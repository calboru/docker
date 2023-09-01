FROM ubuntu:latest

RUN mkdir -p /var/run/sshd

RUN apt update && \
    apt install -y openssh-server && \
    apt install -y fail2ban && \
    mkdir /var/run/fail2ban && \
    cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults && \
    chmod a-w /etc/ssh/sshd_config.factory-defaults

COPY sshd_config /etc/ssh

RUN useradd -rm -d /home/sshu1 -s /bin/bash sshu1 && \
    echo sshu1:%01gZfc2xOwj9iRC | chpasswd

RUN mkdir /home/sshu1/.ssh && \
    chmod 700 /home/sshu1/.ssh  

COPY id_rsa_for_sshu1.pub /home/sshu1/.ssh/authorized_keys

RUN chown sshu1:sshu1 -R /home/sshu1/.ssh && \
    chmod 600 /home/sshu1/.ssh/authorized_keys

#RUN mkdir -p /jail/uploads && \
#    chmod 755 /jail && \
#    chown root:root /jail && \
#    chmod 777 /jail/uploads

RUN mkdir -p /data/uploads && \
    chmod 755 /data && \
    chown root:root /data && \
    chmod 777 /data/uploads

CMD  ["/usr/sbin/sshd", "-D"]

#BEFORE BUILD THE CONTAINER CREATE SSH KEY
#ssh-keygen -b 4096 -f id_rsa_for_sshu1