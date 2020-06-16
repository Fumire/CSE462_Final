#!/bin/sh
echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/profile
. /etc/profile

service sysstat start
cron

$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR nodemanager
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR datanode
