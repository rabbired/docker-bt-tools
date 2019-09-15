#!/bin/sh
if [ "$cron" = "TRUE" ] || [ "$cron" = "ON" ] || [ "$cron" = "true" ] || [ "$cron" = "on" ];
then
    crond -b -L ~/cron.log -c /etc/cron.d
fi
sh -c ~/findsub.sh
