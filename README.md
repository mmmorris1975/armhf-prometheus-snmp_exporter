A Prometheus snmp_exporter Docker image for ARM architectures.  It ships with the snmp_exporter.yml file
bundled with the official release, which will allow basic monitoring of network interface stats and some vendor-specific OIDs

To enable more deatailed collection, you'll need to setup a customized configuration and mount it into the
container.  Something like:

```
docker run -d -p 9116:9116 -v /local/path/to/snmp_exporter.yml:/etc/snmp_exporter/config.yml armhf-prometheus-snmp_exporter:latest
```

See the official github repo: https://github.com/prometheus/snmp_exporter for supported configuration settings.
