#!/bin/bash
NAME_DIR=$1
echo $NAME_DIR

echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/profile
source /etc/profile

service ssh start
service sysstat start
cron

if [ "$(ls -A $NAME_DIR)" ]; then
    echo "NameNode is already formatted."
else
    echo "Format NameNode."
    $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format
fi

$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR resourcemanager
$HADOOP_HOME/bin/mapred historyserver
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
