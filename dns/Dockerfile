FROM ubuntu:latest

RUN apt-get update && apt-get install -y bind9 bind9utils bind9-doc

COPY named.conf.local /etc/bind/named.conf.local
COPY db.tibau.br /etc/bind/db.tibau.br

EXPOSE 53/udp 
EXPOSE 53/tcp

CMD ["named", "-g"]