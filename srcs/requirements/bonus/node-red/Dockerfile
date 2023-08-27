FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -f -y install curl \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt install -y -f nodejs && rm -rf /tmp/*

RUN npm install -g --unsafe-perm node-red

EXPOSE 1880

CMD [ "node-red" ]
