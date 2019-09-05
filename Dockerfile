FROM rabbired/ubuntu-base

MAINTAINER rabbired@outlook.com RedZ

USER root

ENV SUB_DIR=/subfind
ENV CFG_DIR=/config

RUN apt-get -yqq update && apt-get -yqq upgrade && \
    apt-get -yqq install python3-pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 150 && \
    wget http://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && rm -f get-pip.py && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install autoremove-torrents && \
    pip install flexget && \
    pip install subfinder && \
    ln -sf /config/crontab /etc/crontab && \
    apt-get -y autoclean && apt-get -y autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/* /root/sources/*

USER app
