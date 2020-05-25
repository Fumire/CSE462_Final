FROM ubuntu:20.04
LABEL maintainer="jwlee230@unist.ac.kr"

RUN apt-get update
RUN apt-get install -y curl default-jdk

ENV HADOOP_VERSION=3.2.1
ENV HADOOP_URL=http://mirror.apache-kr.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz
RUN tar -xvf /tmp/hadoop.tar.gz -C /opt/
RUN rm /tmp/hadoop.tar.gz

RUN ln -s /opt/hadoop-$HADOOP_VERSION /opt/hadoop
RUN mkdir /opt/hadoop-$HADOOP_VERSION/dfs
RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

ADD core-site.xml /etc/hadoop/

ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /etc/hadoop
ENV PATH $HADOOP_HOME/bin/:$PATH
ENV JAVA_HOME /usr/lib/jvm/default-java
