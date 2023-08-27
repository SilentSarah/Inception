FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -f -y php8.2-fpm php8.2-mysql wget

COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "php-fpm8.2", "--nodaemonize" ]