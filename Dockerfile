FROM node:5.3

MAINTAINER Filipe Farinha <filipe@ktorn.com>

RUN npm install -g scuttlebot
RUN npm install -g git-ssb-web

VOLUME [ "/root/.ssb" ]

EXPOSE 5000
EXPOSE 8008
EXPOSE 8008/udp

CMD [ "sbot", "server", "--host", "sb.hackafe.org" ]
