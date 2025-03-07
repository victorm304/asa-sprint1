FROM ubuntu:latest

RUN apt update --fix-missing -y
RUN apt upgrade -y
RUN apt install postfix dovecot-imapd dovecot-pop3d -y
RUN apt install -q -y syslog-ng


COPY main.cf /etc/postfix
COPY ./dovecot/10-auth.conf /etc/dovecot/conf.d

RUN useradd -m victor
RUN useradd -m machado

RUN echo "victor:projeto"|chpasswd
RUN echo "machado:projeto"|chpasswd


CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; service dovecot start; tail -F /var/log/mail.log"]
