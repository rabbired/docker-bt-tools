FROM python:alpine
MAINTAINER RedZ "rabbired@outlook.com"

ENV UID=1000
ENV GID=1000
ENV UNAME=app
ENV UPASS=passwd
ENV UDIR=/home/$UNAME

ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8
ENV TZ=Asia/Shanghai

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache musl-dev gcc libxml2 libxml2-dev libxslt libxslt-dev sudo tzdata && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install autoremove-torrents flexget subfinder transmissionrpc && \
    apk del --purge --no-cache musl-dev gcc libxml2 libxml2-dev libxslt libxslt-dev && \
    find -type d -name __pycache__ -prune -exec rm -rf {} \; && \
    rm -rf \
        /tmp/* \
        /root/.cache \
        ~/.cache

RUN mkdir -p /config /subfind /torrents && \
    addgroup -g $GID $UNAME && \
    adduser -h $UDIR -u $UID -G $UNAME -D $UNAME && \
    echo "$UNAME:$UPASS" | chpasswd && \
    echo "$UNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "${TZ}" > /etc/timezone && \
    ln -s /usr/share/zoneinfo/$TZ /etc/localtime && \
    ln -sf /config/crontab /etc/crontabs/app

USER $UNAME
WORKDIR $UDIR

CMD [ "/usr/sbin/crond", "-f" ]
