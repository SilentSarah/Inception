FROM debian:bookworm

ARG    MYSQL_ROOT
ARG    MYSQL_ROOT_PASS
ARG    WP_USER
ARG    WP_PASS
ARG    WP_DB
ARG    WP_HOST
ARG    WP_ADM
ARG    WP_ADM_SEC
ARG    WP_ADM_PASS
ARG    WP_ADM_SEC_PASS

ENV    MYSQL_ROOT_PASS=${MYSQL_ROOT_PASS}
ENV    MYSQL_ROOT=${MYSQL_ROOT}
ENV    WP_USER=${WP_USER}
ENV    WP_PASS=${WP_PASS}
ENV    WP_DB=${WP_DB}
ENV    WP_HOST=${WP_HOST}
ENV    WP_ADM=${WP_ADM}
ENV    WP_ADM_SEC=${WP_ADM_SEC}
ENV    WP_ADM_PASS=${WP_ADM_PASS}
ENV    WP_ADM_SEC_PASS=${WP_ADM_SEC_PASS}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \ 
    && apt install -f -y php8.2-cli php8.2-fpm php8.2-mysql php-json php8.2-opcache \
    php8.2-mbstring php8.2-xml php8.2-gd php8.2-curl mariadb-client curl sendmail \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY tools/setup.sh /setup.sh
RUN bash /setup.sh
COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "php-fpm8.2", "--nodaemonize" ]
