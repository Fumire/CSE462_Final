FROM base:3.2.1

RUN mkdir /opt/hadoop/dfs/data
VOLUME /opt/hadoop/dfs/data

ADD start.sh /start.sh
RUN chmod a+x /start.sh

EXPOSE 9864 9866 50010 50075

CMD ["/start.sh"]
