# HBase in Docker


# http://docs.docker.io/en/latest/use/builder/

FROM ubuntu:bionic
MAINTAINER ShlomiTubul <shlomitub28@hotmail.com>

COPY *.sh /build/

ENV HBASE_VERSION 2.2.4
ENV HBASE_PHOENIX_VERSION 2.0
ENV PHOENIX_VERSION 5.0.0
ENV PHOENIX_CLASS_PATH /opt/hbase/lib/:/opt/phoenix/
ENV HADOOP_CONF_DIR /opt/hbase/conf
ENV PHOENIX_LIB_DIR /opt/phoenix
RUN /build/prepare-hbase.sh && /build/prepare-phoenix.sh &&\
    cd /opt/hbase && /build/build-hbase.sh \
    cd / && /build/build-phoenix.sh && /build/cleanup-hbase.sh  && rm -rf /build

VOLUME /data

ADD ./hbase-site.xml /opt/hbase/conf/hbase-site.xml

ADD ./zoo.cfg /opt/hbase/conf/zoo.cfg

ADD ./replace-hostname /opt/replace-hostname

ADD ./hbase-server /opt/hbase-server
ADD ./cod-start /opt/cod-start

# REST API
EXPOSE 8080
# REST Web UI at :8085/rest.jsp
EXPOSE 8085
# Thrift API
EXPOSE 9090
# Thrift Web UI at :9095/thrift.jsp
EXPOSE 9095
# HBase's Embedded zookeeper cluster
EXPOSE 2181
# HBase Master web UI at :16010/master-status;  ZK at :16010/zk.jsp
EXPOSE 16010

ENTRYPOINT ["/opt/cod-start"]
