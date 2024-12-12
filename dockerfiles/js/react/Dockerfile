FROM ubuntu:24.04
ENV USUARIO="cristian"
ENV PASSWORD="usuario"

ARG TZ
ARG CONTEXT

ARG AUTOR
USER root
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -yq --no-install-recommends \
    apt-utils \
    wget curl git \
    nano \ 
    tree \
    net-tools \ 
    iputils-ping \
    sudo \ 
    openssh-server \ 
    openssh-client \
    unzip \
    dos2unix \ 
    expect \
    python3

RUN mkdir /var/run/sshd
EXPOSE 80 22

# Configurar SSH para aceptar conexiones
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

RUN mkdir /root/logs
RUN mkdir /root/datos
RUN touch /root/logs/build.log
COPY ./proyectos/${PROYECTO}/deploy/usuarios.txt /root/datos
RUN echo "contexto: ${D_FILES}" 

RUN mkdir /root/admin
COPY ./dockerfiles/ubuntu/admin /root/admin

RUN chmod +x /root/admin/start.sh
WORKDIR /root/admin

CMD service nginx start && /usr/sbin/sshd -D

ENTRYPOINT ["/root/admin/start.sh"]