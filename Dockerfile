FROM node:alpine3.20
ENV TZ=Asia/Shanghai
WORKDIR /app

COPY index.js /app/index.js
COPY package.json /app/package.json
COPY public /app/public

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.js"]
