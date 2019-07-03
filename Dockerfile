FROM node:lts-alpine as BUILD

ENV NODE_ENV production

RUN apk add --update --no-cache git

RUN git clone --branch '1.0.0' --single-branch --depth 1 https://github.com/ansible-community/ara-web /srv/ara-web

WORKDIR /srv/ara-web

RUN npm install

RUN npm run build

FROM node:lts-alpine

COPY --from=BUILD /srv/ara-web/build /srv/ara-web/build

WORKDIR /srv/ara-web

RUN npm install -g serve

EXPOSE 5000

COPY entrypoint.sh .

CMD ./entrypoint.sh
