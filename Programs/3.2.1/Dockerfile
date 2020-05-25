FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl

ENV HADOOP_VERSION=3.2.1
ENV HADOOP_URL=http://mirror.apache-kr.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz
RUN tar -xvf /tmp/hadoop.tar.gz -C /opt/
RUN rm /tmp/hadoop.tar.gz

RUN ln -s /opt/hadoop-$HADOOP_VERSION /opt/hadoop
RUN mkdir /opt/hadoop/dfs
RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN rm -rf /opt/hadoop/share/doc

ADD core-site.xml /etc/hadoop/

ENV HADOOP_PREFIX /opt/hadoop
ENV HADOOP_CONF_DIR /etc/hadoop
ENV PATH $HADOOP_PREFIX/bin/:$PATH
ENV JAVA_HOME /usr/lib/jvm/zulu-8-amd64
