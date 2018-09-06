#!/bin/bash
echo "flume-1 start ......"
bin/flume-ng agent --conf ./conf/ -f conf/flume-conf.properties -Dflume.root.logger=INFO,console -n agent1
