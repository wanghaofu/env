#!/bin/bash
#当主恢复时设定本机为主的从 等待15s

REDISCLI="/usr/local/redis/redis-cli"
LOGFILE="/var/log/keepalived-redis-state.log"
echo "#`date +"%Y-%m-%d %H:%M:%S"` [notify_backup]" >> $LOGFILE 2>&1
echo "#`date +"%Y-%m-%d %H:%M:%S"` Run [Sleep 15s]" >> $LOGFILE 2>&1
sleep 15
echo "#`date +"%Y-%m-%d %H:%M:%S"` Run [SLAVEOF 192.168.2.9 6379]" >> $LOGFILE 2>&1
$REDISCLI SLAVEOF 192.168.2.9 6379 >> $LOGFILE 2>&1
echo "#`date +"%Y-%m-%d %H:%M:%S"` Operater End" >> $LOGFILE 2>&1
