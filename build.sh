#!/bin/bash -x

ver=${VERSION:="0.7.0"}
exp_name=snmp_exporter

NAME=$(basename $(dirname $PWD/Dockerfile))
URL="https://github.com/prometheus/${exp_name}/releases/download/v${ver}/${exp_name}-${ver}.linux-armv7.tar.gz"

wget -N $URL
tar xzf ${exp_name}-${ver}.linux-armv7.tar.gz --strip-components 1 --wildcards "*/snmp*"

docker build -t ${NAME}:${ver} -t ${NAME}:latest .

rm snmp_exporter snmp.yml
