FROM base:3.2.1

RUN mkdir /opt/hadoop/dfs/data
VOLUME /opt/hadoop/dfs/data

ADD hdfs-site.xml /etc/hadoop/hdfs-site.xml
ADD yarn-site.xml /etc/hadoop/yarn-site.xml

RUN mkdir /Scripts
VOLUME /Scripts

ADD start.sh /start.sh
RUN chmod a+x /start.sh

EXPOSE 9864 9866 50010 50075

CMD ["/start.sh"]
