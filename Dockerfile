FROM node:16.13-alpine as builder

WORKDIR /home/dataform_bigquery

RUN apk --no-cache add build-base python3

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

RUN npm install

FROM node:16.13-alpine

WORKDIR /home/dataform_bigquery


COPY package.json .
COPY package-lock.json .

# RUN apk --no-cache add --virtual builds-deps build-base python3 && yarn install --prod && yarn cache clean && apk del builds-deps && rm -rf /var/cache/apk/* /root/.cache /tmp/*

EXPOSE 8088
CMD ["npm", "start"]
