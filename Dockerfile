FROM python:3.7-alpine

ENV SUBFIND_DIR=/movie
ENV CONFIG_DIR=/config
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8
ENV TZ=Asia/Shanghai
ENV UMASK_SET=000

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --virtual .build-deps gcc libc-dev libxml2-dev libxslt-dev unzip unrar tzdata && \
    cp -f /usr/share/zoneinfo/$TZ /etc/localtime && \
    pip install --upgrade pip && \
    pip install subfinder && \
    pip install autoremove-torrents && \
    apk del tzdata && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache && \
    rm -rf /tmp/* && \
    umask $UMASK_SET

ADD start.sh /start.sh

WORKDIR /

CMD ["/bin/sh", "/start.sh"]
