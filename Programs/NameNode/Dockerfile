FROM base:3.2.1

ADD hdfs-site.xml /etc/hadoop/hdfs-site.xml

CMD mkdir /opt/hadoop/dfs/name
VOLUME /opt/hadoop/dfs/name

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 9000 50070

CMD ["/start.sh", "/opt/hadoop/dfs/name"]
