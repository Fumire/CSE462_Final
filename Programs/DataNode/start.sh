#!/bin/sh
echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/profile
. /etc/profile

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR datanode
