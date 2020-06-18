FROM base:2.9.2

HEALTHCHECK CMD curl -f http://localhost:9870 || exit 1

VOLUME /app-logs

ADD masters /etc/hadoop/masters
ADD slaves /etc/hadoop/slaves

RUN mkdir -p /opt/hadoop/dfs/name
VOLUME /opt/hadoop/dfs/name

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 9000 19888 10033 50070 22 8088 8030 8031 8032 8033 10020

CMD ["/start.sh", "/opt/hadoop/dfs/name"]
