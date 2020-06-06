FROM base:3.2.1

HEALTHCHECK CMD curl -f http://localhost:9870 || exit 1

VOLUME /app-logs

ADD masters /etc/hadoop/masters
ADD slaves /etc/hadoop/slaves

RUN mkdir -p /opt/hadoop/dfs/name
VOLUME /opt/hadoop/dfs/name

ADD start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 9000 9820 9870 9871
EXPOSE 9864 9865 9866 9867
EXPOSE 8030 8031 8032 8033 8040 8042 8088
EXPOSE 10020 19888

CMD ["/start.sh", "/opt/hadoop/dfs/name"]
