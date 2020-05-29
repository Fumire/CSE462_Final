FROM base:3.2.1

HEALTHCHECK CMD curl -f http://localhost:9870 || exit 1

ADD hdfs-site.xml /etc/hadoop/hdfs-site.xml
ADD yarn-site.xml /etc/hadoop/yarn-site.xml
VOLUME /app-logs

RUN mkdir -p /opt/hadoop/dfs/name
VOLUME /opt/hadoop/dfs/name

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 9000 9870 50070

CMD ["/start.sh", "/opt/hadoop/dfs/name"]
