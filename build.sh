#!/bin/bash -x

ver=${VERSION:="0.7.0"}
exp_name=snmp_exporter

declare -a TAGS
TAGS=($ver)

NAME=$(basename $(dirname $PWD/Dockerfile))
URL="https://github.com/prometheus/${exp_name}/releases/download/v${ver}/${exp_name}-${ver}.linux-armv7.tar.gz"

wget -N $URL
tar xzf ${exp_name}-${ver}.linux-armv7.tar.gz --strip-components 1 --wildcards "*/snmp*"

if [ $REPO_HOST ]
then
  NAME=${REPO_HOST}/${NAME}
fi

docker build -t ${NAME}:latest $@ .

if [ $REPO_HOST ]
then
  docker push ${NAME}:latest
fi

for i in ${TAGS[@]}
do
  docker tag ${NAME}:latest ${NAME}:$i

  if [ $REPO_HOST ]
  then
    docker push ${NAME}:$i
  fi
done

rm snmp_exporter snmp.yml
