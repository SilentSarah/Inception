FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -f -y php8.2-cli php8.2-fpm php8.2-mysql php-json php8.2-opcache \
    php8.2-mbstring php8.2-xml php8.2-gd php8.2-curl wget zip unzip

COPY tools/setup.sh /setup.sh

RUN bash setup.sh

EXPOSE 9000

CMD [ "php-fpm8.2", "--nodaemonize" ]
