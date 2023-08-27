FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -f -y lsb-release curl gpg \
    && curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list \
    && apt update \
    && apt install -f -y redis-server php-redis

COPY tools/setup.sh /setup.sh

RUN bash /setup.sh

RUN service redis-server start

EXPOSE 6379

CMD [ "redis-server", "--daemonize no", "--protected-mode no" ]