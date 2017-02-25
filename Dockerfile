FROM armhf-prometheus-busybox:latest
MAINTAINER Mike Morris

COPY snmp_exporter  /bin/snmp_exporter
COPY snmp.yml       /etc/snmp_exporter/config.yml

EXPOSE      9116
ENTRYPOINT  [ "/bin/snmp_exporter" ]
CMD [ "-config.file=/etc/snmp_exporter/config.yml" ]
