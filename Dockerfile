FROM python:3.7-alpine

ENV SUBFIND_DIR=/movie
ENV CONFIG_DIR=/config

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --virtual .build-deps gcc libc-dev libxml2-dev libxslt-dev unzip unrar && \
    pip install --upgrade pip && \
    pip install subfinder && \
    pip install pip install autoremove-torrents

ADD start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]
