#!/bin/bash
NAME_DIR=$1
echo $NAME_DIR

echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/profile
source /etc/profile

if [ "$(ls -A $NAME_DIR)" ]; then
    echo "NameNode is already formatted."
else
    echo "Format NameNode."
    $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format
fi

$HADOOP_HOME/bin/mapred --daemon start historyserver
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
