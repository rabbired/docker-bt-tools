#!/bin/sh
echo '0    0 * * * pip install subfinder --upgrade' > /etc/crontabs/root
echo '0    0 * * * pip install autoremove-torrents --upgrade' > /etc/crontabs/root
echo '0    * * * * subfinder ${SUBFIND_DIR} -l zh -m shooter' >> /etc/crontabs/root
echo '0    * * * * subfinder ${SUBFIND_DIR} -l zh_chs -m zimuku' >> /etc/crontabs/root
echo '0    * * * * subfinder ${SUBFIND_DIR} -l zh_chs -m zimuzu' >> /etc/crontabs/root
echo '*/15 * * * * autoremove-torrents --conf=${CONFIG_DIR}/config.yml' >> /dev/null 2>&1

crond -f -d 8
