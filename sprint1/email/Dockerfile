FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y postfix
RUN apt-get install -y dovecot-core dovecot-imapd dovecot-pop3d syslog-ng

COPY postfix/main.cf /etc/postfix/main.cf
COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY dovecot/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
COPY dovecot/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
COPY dovecot/10-master.conf /etc/dovecot/conf.d/10-master.conf

EXPOSE 25 587 993 995

CMD ["sh", "-c", "service syslog-ng start && service postfix start && service dovecot start && tail -f /var/log/mail.log"]
