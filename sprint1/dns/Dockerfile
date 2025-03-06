
FROM ubuntu:latest 

RUN apt update -y 

RUN apt install bind9 dnsutils -y

COPY named.conf.local /etc/bind

COPY ./areiabranca.com.br.zone /etc/bind
COPY ./pontanegra.com.br.zone /etc/bind
COPY ./praiadomeio.com.br.zone /etc/bind
COPY ./madeiro.com.br.zone /etc/bind
COPY ./golfinhos.com.br.zone /etc/bind

RUN chgrp bind /etc/bind/praiadomeio.com.br.zone 
RUN chgrp bind /etc/bind/pontanegra.com.br.zone
RUN chgrp bind /etc/bind/areiabranca.com.br.zone
RUN chgrp bind /etc/bind/madeiro.com.br.zone
RUN chgrp bind /etc/bind/golfinhos.com.br.zone

RUN chgrp bind /etc/bind/named.conf.local
RUN chmod 770 /etc/bind/*


EXPOSE 53/tcp
EXPOSE 53/udp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
