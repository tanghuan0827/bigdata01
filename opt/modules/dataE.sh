#!/bin/bash

nohup hbase/bin/stop-hbase.sh  &
 sleep 10
nohup hadoop/sbin/stop-yarn.sh &
 sleep 10
nohup hadoop/sbin/hadoop-daemon.sh stop zkfc &
 sleep 5
nohup hadoop/sbin/stop-dfs.sh &
