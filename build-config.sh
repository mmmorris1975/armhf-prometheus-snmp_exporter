#!/bin/bash -x

REPO_DIR=$PWD
BUILD_PATH='github.com/prometheus/snmp_exporter/generator'
SNMP_EXPORTER_VERSION="v0.6.0"

export GOPATH=$REPO_DIR/go
mkdir -p $GOPATH

go get -d -u $BUILD_PATH

cd $GOPATH/src/$BUILD_PATH
git checkout $SNMP_EXPORTER_VERSION
go build -v

cp generator $REPO_DIR/

# Build using our own generator.yml to get rid of the vendor-specific noise
cd $REPO_DIR
./generator generate
