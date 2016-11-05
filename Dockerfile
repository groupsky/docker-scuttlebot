FROM node:5.3

MAINTAINER Filipe Farinha <filipe@ktorn.com>

RUN npm install -g scuttlebot@9.1.1

ADD scripts/run-sbot.sh /run-sbot.sh
RUN chmod +x /run-sbot.sh

VOLUME [ "/root/.ssb" ]

EXPOSE 8008
EXPOSE 8008/udp

CMD [ "/run-sbot.sh" ]
