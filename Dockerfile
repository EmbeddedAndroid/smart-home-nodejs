FROM node:alpine

RUN apk add --no-cache git

WORKDIR /src

COPY . /src

RUN cd smart-home-provider/frontend && \
    npm install -g bower && \
    bower install --allow-root && \
    cd .. && \
    npm install

ENTRYPOINT ["/usr/local/bin/node", "/src/smart-home-provider/cloud/smart-home-provider-cloud.js"]
