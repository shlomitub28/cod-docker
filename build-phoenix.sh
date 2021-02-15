#!/bin/sh -xe

. /build/config.sh

here=$(pwd)

# delete files that are not needed to run hbase
cd /opt
cp phoenix/phoenix-$PHOENIX_VERSION-HBase-$HBASE_PHOENIX_VERSION-server.jar /opt/hbase/lib
cp phoenix/phoenix-$PHOENIX_VERSION-HBase-$HBASE_PHOENIX_VERSION-queryserver.jar /opt/hbase/lib
cp phoenix/phoenix-$PHOENIX_VERSION-HBase-$HBASE_PHOENIX_VERSION-client.jar /opt/hbase/lib
cp phoenix/phoenix-$PHOENIX_VERSION-HBase-$HBASE_PHOENIX_VERSION-thin-client.jar /opt/hbase/lib
cp /opt/hbase/conf/log4j.properties /opt/phoenix
