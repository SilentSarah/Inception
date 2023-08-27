FROM debian:bookworm

ARG MYSQL_ROOT_PASS
ARG WP_USER
ARG WP_PASS
ARG WP_DB

ENV MYSQL_ROOT_PASS=$MYSQL_ROOT_PASS
ENV WP_USER=$WP_USER
ENV WP_PASS=$WP_PASS
ENV WP_DB=$WP_DB

ENV  DEBIAN_FRONTEND=noninteractive

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt update && \
    apt install -y -f mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/setup.sql /setup.sql
COPY ./tools/setup.sh /setup.sh

EXPOSE 3306

ARG MYSQL_ROOT=${MYSQL_ROOT}
ENV MYSQL_ROOT=${MYSQL_ROOT}

RUN bash setup.sh

CMD [ "mariadbd", "--user=root", "--bind-address=0.0.0.0"]
