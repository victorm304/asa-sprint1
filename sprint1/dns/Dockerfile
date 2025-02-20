FROM ubuntu:latest

RUN apt-get update && apt-get install -y bind9 bind9utils bind9-doc

COPY named.conf.local /etc/bind/
COPY areiabranca.hosts /etc/bind/

EXPOSE 53/udp 
EXPOSE 53/tcp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]