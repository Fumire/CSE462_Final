FROM ubuntu:20.04
LABEL maintainer="jwlee230@unist.ac.kr"

RUN apt-get update
RUN apt-get install -y curl openjdk-8-jdk vim ssh net-tools curl netcat openssh-server make sysstat

ENV HADOOP_VERSION "3.2.1"
ENV HADOOP_URL "http://mirror.apache-kr.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz"

RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz
RUN tar -xvf /tmp/hadoop.tar.gz -C /opt/
RUN rm /tmp/hadoop.tar.gz

RUN sed -i "s/ENABLED=\"false\"/ENABLED=\"true\"/g" /etc/default/sysstat
RUN echo "* * * * * root /usr/lib/sysstat/debian-sa1 > /dev/null && /usr/lib/sysstat/debian-sa1 1 1" >> /etc/cron.d/sysstat

RUN ln -s /opt/hadoop-$HADOOP_VERSION /opt/hadoop
RUN mkdir /opt/hadoop-$HADOOP_VERSION/dfs
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs
RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

ADD core-site.xml /etc/hadoop/
ADD hdfs-site.xml /etc/hadoop/hdfs-site.xml
ADD yarn-site.xml /etc/hadoop/yarn-site.xml
ADD mapred-site.xml /etc/hadoop/mapred-site.xml

ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /etc/hadoop
ENV PATH $HADOOP_HOME/bin/:/usr/lib/sysstat:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN ssh-keygen -t rsa -P "" -f /root/.ssh/id_rsa
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/" >> /etc/hadoop/hadoop-env.sh

ENV user "root"
ENV HDFS_NAMENODE_USER "root"
ENV HDFS_DATANODE_USER "root"
ENV HDFS_SECONDARYNAMENODE_USER "root"
ENV YARN_RESOURCEMANAGER_USER "root"
ENV YARN_NODEMANAGER_USER "root"
