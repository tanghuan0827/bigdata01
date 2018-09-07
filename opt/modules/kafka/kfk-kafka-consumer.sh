#!/bin/bash

bin/kafka-console-consumer.sh --zookeeper bigdata-pro01.kfk.com:2181,bigdata-pro02.kfk.com:2181,bigdata-pro03.kfk.com:2181 --topic weblogs --from-beginning
