FROM ubuntu:16.04

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update -y \
    && apt-get install -y git curl wget nano supervisor build-essential \
    && mkdir -p /home/truffle-app

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 9.9.0

# install nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

ADD . /home/truffle-app

WORKDIR /home/truffle-app

RUN npm install

CMD ["npm", "run", "watch"]