FROM debian:bookworm

ARG DOMAIN_NAME

ENV DOMAIN_NAME=$DOMAIN_NAME
ENV DEBIAN_FRONTEND=noninteractive
RUN groupadd -r nginx && useradd -r -g nginx nginx

RUN apt update && \
    apt install -f -y nginx && \
    apt install -y openssl && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./static_page/index.html /var/www/banana/index.html
COPY ./tools/genSSL.sh /etc/nginx/ssl/genSSL.sh
COPY ./tools/entrypoint.sh /entrypoint.sh

RUN  cd /etc/nginx/ssl && bash genSSL.sh \
     && rm -rf genSSL.sh && chmod +x /entrypoint.sh

EXPOSE 443
EXPOSE 80

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["nginx"]
