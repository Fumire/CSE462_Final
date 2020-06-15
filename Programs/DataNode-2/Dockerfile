FROM base:2.9.2

RUN mkdir /opt/hadoop/dfs/data
VOLUME /opt/hadoop/dfs/data

RUN mkdir -p /etc/hadoop/logs

RUN mkdir /Scripts
VOLUME /Scripts

ADD start.sh /start.sh
RUN chmod a+x /start.sh

EXPOSE 22
EXPOSE 9864 9866 50010 50075
EXPOSE 9867 41335

CMD ["/start.sh"]
