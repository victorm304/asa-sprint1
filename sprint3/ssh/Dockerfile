FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y openssh-server dnsutils net-tools nano vim && \
    mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
 
RUN useradd -m -s /bin/bash victor && \
    echo "victor:comp" | chpasswd && \
    adduser victor sudo

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]