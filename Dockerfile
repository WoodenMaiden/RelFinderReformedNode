FROM node:16-alpine

COPY ./ /web
WORKDIR /web

RUN mv docker-entrypoint.sh /docker-entrypoint.sh
RUN npm i -g typescript

RUN npm i
RUN npm run build

RUN rm -rf src typings tsconfig.json tslint.json

ENTRYPOINT [ "/docker-entrypoint.sh" ] 
CMD [ "http://172.17.0.1:8888/sparql", "-c", "no-crash", "--loglevel", "INFO" ]