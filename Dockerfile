FROM ubuntu:20.04

COPY . .

RUN apt-get update && apt-get install -y lsb-release git sudo curl make gcc g++ python3-dev && apt-get clean all

RUN INSTALL_PYTHON_VERSION=3.8 ./install.sh -d -a

ENV NODE_VERSION=16.16.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

# RUN source venv/bin/activate

# RUN cd ./build_scripts && ./build_linux_deb-1-gui.sh
