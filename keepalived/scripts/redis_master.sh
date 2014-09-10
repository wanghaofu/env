#!/bin/bash
REDISCLI="/usr/local/redis/redis-cli"
LOGFILE="/var/log/keepalived-redis-state.log"
echo "#`date +"%Y-%m-%d %H:%M:%S"` [notify_master] " >> $LOGFILE 2>&1
echo "#`date +"%Y-%m-%d %H:%M:%S"` Being master..." >> $LOGFILE 2>&1
echo "#`date +"%Y-%m-%d %H:%M:%S"` Run [SLAVEEOF 192.168.2.10 6379]" >> $LOGFILE 2>&1
$REDISCLI SLAVEOF 192.168.2.10 6379 >> $LOGFILE 2>&1
echo "#`date +"%Y-%m-%d %H:%M:%S"` Run [Sleep 10s]" >> $LOGFILE 2>&1
sleep 10

echo "#`date +"%Y-%m-%d %H:%M:%S"` Run [SLAVEOF NO ONE] " >> $LOGFILE 2>&1
$REDISCLI SLAVEOF NO ONE >> $LOGFILE 2>&1
echo "#End SLAVEOF NO ONE" >> $LOGFILE 2>&1
