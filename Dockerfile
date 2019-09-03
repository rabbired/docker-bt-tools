FROM python:3.7-alpine

ARG SUBFIND_DIR
ARG CONFIG_DIR

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --virtual .build-deps gcc libc-dev libxml2-dev libxslt-dev unzip unrar && \
    pip install --upgrade pip && \
    pip install subfinder && \
    pip install pip install autoremove-torrents

RUN echo '0    0 * * * pip install subfinder --upgrade' > /etc/crontabs/root && \
    echo '0    0 * * * pip install autoremove-torrents --upgrade' > /etc/crontabs/root && \
    echo '0    * * * * subfinder ${SUBFIND_DIR} -l zh -m shooter' >> /etc/crontabs/root && \
    echo '0    * * * * subfinder ${SUBFIND_DIR} -l zh_chs -m zimuku' >> /etc/crontabs/root && \
    echo '0    * * * * subfinder ${SUBFIND_DIR} -l zh_chs -m zimuzu' >> /etc/crontabs/root && \
    echo '*/15 * * * * autoremove-torrents --conf=${CONFIG_DIR}/config.yml' >> /dev/null 2>&1

CMD ["crond", "-f", "-d", "8"]
