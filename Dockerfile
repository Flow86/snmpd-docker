FROM ubuntu:latest

RUN apt-get update -y && \
  apt-get install -y snmp snmpd snmp-mibs-downloader && \
  apt-get clean && \
  sed -i 's/agentAddress  udp:127.0.0.1:161/agentAddress  udp:0.0.0.0:161/g' /etc/snmp/snmpd.conf

COPY container-files /

EXPOSE 161

ENTRYPOINT ["/bootstrap.sh"]
