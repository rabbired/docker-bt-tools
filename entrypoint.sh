#!/bin/sh
if [ "$CRON" = "TRUE" ] || [ "$CRON" = "ON" ] || [ "$CRON" = "true" ] || [ "$CRON" = "on" ];
then
    crond -b -L ~/cron.log -c /etc/cron.d
fi
sh -c ~/findsub.sh
