FROM ubuntu:latest

ARG USER_NAME
ARG USER_PASSWORD

RUN echo ${USER_NAME}
RUN echo ${USER_PASSWORD}

RUN mkdir -p /var/run/sshd

RUN apt update && \
    apt install -y openssh-server iptables curl

RUN useradd -rm -d /home/${USER_NAME} -s /bin/bash ${USER_NAME} && \
    echo ${USER_NAME}:${USER_PASSWORD} | chpasswd

RUN mkdir /home/${USER_NAME}/.ssh && \
    chmod 700 /home/${USER_NAME}/.ssh  

COPY ./ssh-server/keys/id_rsa_for_sshu1.pub /home/${USER_NAME}/.ssh/authorized_keys

RUN chown ${USER_NAME}:${USER_NAME} -R /home/${USER_NAME}/.ssh && \
    chmod 600 /home/${USER_NAME}/.ssh/authorized_keys

RUN echo 'INSTALLING CROWDSEC'

RUN curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.deb.sh | bash

RUN echo 'INSTALLING IP TABLES BOUNCER'

RUN apt install -y crowdsec-firewall-bouncer-iptables

COPY ./ssh-server/start_ssh_server.sh /usr/local/bin  

RUN chmod +x /usr/local/bin/start_ssh_server.sh

CMD /usr/local/bin/start_ssh_server.sh

EXPOSE  2222

#BEFORE BUILD THE CONTAINER CREATE SSH KEY
#ssh-keygen -b 4096 -f id_rsa_for_sshu1

#INSPECT
#sudo docker logs --tail 50 --follow --timestamps ssh-server