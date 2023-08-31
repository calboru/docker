FROM ubuntu:latest

RUN apt update && \
    apt install -y zsh && \
    chsh -s /usr/bin/zsh && \
    apt install -y wget curl git iputils-ping nodejs npm nano && \
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"  && \
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash  

RUN npm install --global yarn

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]