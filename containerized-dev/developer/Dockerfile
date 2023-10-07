FROM ubuntu:latest

RUN apt update && \
    apt install -y wget curl git iputils-ping npm nano 

 

RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 18.18.0
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH 

RUN apt install -y zsh && \
    chsh -s /usr/bin/zsh && \
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"  

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]