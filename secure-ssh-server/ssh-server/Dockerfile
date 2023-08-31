FROM ubuntu:latest

RUN mkdir -p /var/run/sshd

RUN apt update && \
    apt install -y open-ssh-server && \
    apt install -y fail2ban && \
    mkdir /var/run/fail2ban && \
    cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults && \
    chmod a-w /etc/ssh/sshd_config.factory-defaults


ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]