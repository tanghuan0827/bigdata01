#!/bin/bash
cd /opt/modules
nohup hadoop/sbin/start-dfs.sh &
sleep 20
nohup hadoop/sbin/hadoop-daemon.sh start zkfc &
sleep 5
nohup hadoop/sbin/start-yarn.sh &
sleep 10
nohup hbase/bin/start-hbase.sh  
