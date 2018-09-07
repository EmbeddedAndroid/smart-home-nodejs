FROM node:alpine

RUN apk add --no-cache git

WORKDIR /src

COPY . /src

RUN cd smart-home-provider/frontend && \
    npm install -g bower && \
    bower install --allow-root && \
    cd .. && \
    npm install

CMD ["node cloud/smart-home-provider-cloud.js smart-home="http://leshan.ml"]
