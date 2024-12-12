ARG AUTOR
FROM ${AUTOR}/ubuntubase

ENV USUARIO="cristian"
ENV PASSWORD="usuario"
ARG CONTEXT
ARG PROYECTO
ARG TZ

USER root
RUN apt update && apt install -yq --no-install-recommends \
    nginx

COPY ./proyectos/${PROYECTO}/deploy/config/default.conf /etc/nginx/conf.d/default.conf

COPY ./proyectos/${PROYECTO}/deploy/html /var/www/html

RUN chmod -R 755 /var/www/html
RUN mkdir -p /var/log/nginx
EXPOSE 80

USER root
RUN mkdir /root/admin/nginx
COPY ./dockerfiles/sweb/nginx /root/admin/nginx
RUN chmod +x /root/admin/nginx/admin/start.sh

WORKDIR /root/admin/nginx
ENTRYPOINT ["./admin/start.sh"]