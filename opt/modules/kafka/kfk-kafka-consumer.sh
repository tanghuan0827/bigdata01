<<<<<<< HEAD
#!/bin/bash

bin/kafka-console-consumer.sh --zookeeper bigdata-pro01.kfk.com:2181,bigdata-pro02.kfk.com:2181,bigdata-pro03.kfk.com:2181 --topic weblogs --from-beginning
=======
echo "kfk-kafka-consumer.sh start ......"
bin/kfk-kafka-consumer.sh --create --zookeeper bigdata-pro01.kfk.com:2181,bigdata-pro02.kfk.com:2181,bigdata-pro03.kfk.com:2181 --from-beginning --topic test


>>>>>>> parent of 9495ed3... #
