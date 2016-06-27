FROM jackluo/hadoop-base:1.1

ADD zookeeper-3.4.8.tar.gz /usr/local/
ENV ZOOKEEPER_HOME /usr/local/zookeeper-3.4.8
WORKDIR /usr/local/zookeeper-3.4.8
RUN mkdir -p /usr/local/zookeeper-3.4.8/data
RUN mkdir -p /usr/local/zookeeper-3.4.8/log
ENV PATH $PATH:$ZOOKEEPER_HOME/bin
COPY conf/* ./conf/

RUN mv ./conf/start-zookeeper.sh ./bin/
#RUN mv ./conf/supervisord.conf /etc/supervisor/supervisord.conf
RUN chmod a+x ./bin/start-zookeeper.sh
EXPOSE 2181
#CMD ["/bin/bash","/usr/local/zookeeper-3.4.8/bin/start-zookeeper.sh"]
#ENTRYPOINT ["/usr/local/zookeeper-3.4.8/bin/start-zookeeper.sh"]
#CMD ["supervisord", "--nodaemon"]
#ENTRYPOINT ["/bin/bash","-c","/usr/local/zookeeper-3.4.8/bin/start-zookeeper.sh"]
#CMD ["start-foreground"]
#CMD ["./bin/start-zookeeper.sh"]
ENTRYPOINT ["/usr/local/zookeeper-3.4.8/bin/start-zookeeper.sh"]
#CMD ["/bin/bash","-c","/usr/local/zookeeper-3.4.8/bin/zkServer.sh start-foreground"]
