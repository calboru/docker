FROM alpine:latest

ARG USER_NAME
ARG USER_PASSWORD

RUN echo ${USER_NAME}
RUN echo ${USER_PASSWORD}

RUN mkdir -p /var/run/sshd

RUN apk update && \
    apk add openssh-server 

RUN useradd -rm -d /home/${USER_NAME} -s /bin/bash ${USER_NAME} && \
    echo ${USER_NAME}:${USER_PASSWORD} | chpasswd

RUN mkdir /home/${USER_NAME}/.ssh && \
    chmod 700 /home/${USER_NAME}/.ssh  

COPY ./ssh-server/keys/id_rsa_for_sshu1.pub /home/${USER_NAME}/.ssh/authorized_keys

RUN chown ${USER_NAME}:${USER_NAME} -R /home/${USER_NAME}/.ssh && \
    chmod 600 /home/${USER_NAME}/.ssh/authorized_keys

RUN mkdir -p /sftp_data/uploads && \
    chmod 755 /sftp_data && \
    chown root:root /sftp_data && \
    chmod 777 /sftp_data/uploads

CMD /usr/sbin/sshd -D -E /var/log/auth.log

#BEFORE BUILD THE CONTAINER CREATE SSH KEY
#ssh-keygen -b 4096 -f id_rsa_for_sshu1

#INSPECT
#sudo docker logs --tail 50 --follow --timestamps ssh-server