#!/bin/bash

REDISCLI="/usr/local/redis/redis-cli"
LOGFILE="/var/log/keepalived-redis-state.log"

echo "[master]" >> $LOGFILE
echo "#`date +"%Y-%m-%d %H:%M:%S"` [Staring slave to master] " >> $LOGFILE 2>&1
echo "#`date +"%Y-%m-%d %H:%M:%S"` Run [SLAVEOF 192.168.2.9] " >> $LOGFILE 2>&1
#设定本机服务为主的从
$REDISCLI SLAVEOF 192.168.2.9 6379 >> $LOGFILE  2>&1
echo "#`date +"%Y-%m-%d %H:%M:%S"` Run [Sleep 10s]" >> $LOGFILE 2>&1
sleep 10 #延迟10秒以后待数据同步完成后再取消同步状态
#取消从设定
echo "#`date +"%Y-%m-%d %H:%M:%S"` Run [SLAVEOF NO ONE]" >> $LOGFILE 2>&1
$REDISCLI SLAVEOF NO ONE >> $LOGFILE 2>&1
echo "#`date +"%Y-%m-%d %H:%M:%S"` #Slave changed to master ok" >> $LOGFILE 2>&1
