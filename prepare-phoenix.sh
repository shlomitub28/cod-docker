#!/bin/sh -xe

. /build/config.sh

apt-get update -y
apt-get install $minimal_apt_get_args $PHOENIX_BUILD_PACKAGES

cd /opt/


curl -SL $PHOENIX_DIST/apache-phoenix-$PHOENIX_VERSION-HBase-$HBASE_PHOENIX_VERSION/bin/apache-phoenix-$PHOENIX_VERSION-HBase-$HBASE_PHOENIX_VERSION-bin.tar.gz | tar -x -z
mv apache-phoenix-${PHOENIX_VERSION}-HBase-$HBASE_PHOENIX_VERSION-bin phoenix
