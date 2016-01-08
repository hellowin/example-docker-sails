FROM node:4-slim

MAINTAINER Andi N. Dirgantara <andi.n.dirgantara@gmail.com>

RUN mkdir -p /app
WORKDIR /app

COPY . /app
RUN npm install

CMD [ "node", "app.js" ]
