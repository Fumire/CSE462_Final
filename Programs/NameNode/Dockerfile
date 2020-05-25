FROM base:3.2.1

HEALTHCHECK --interval=30s --timeout=30s --retries=3 CMD curl -f http://localhost:50070/ || exit 1

ADD hdfs-site.xml /etc/hadoop/hdfs-site.xml

RUN mkdir /opt/hadoop/dfs/name
VOLUME /opt/hadoop/dfs/name

ADD start.sh /start.sh
RUN chmod a+x /start.sh

EXPOSE 9000 50070

CMD ["/start.sh", "/opt/hadoop/dfs/name"]
