FROM debian:bookworm

ARG FTP_USER
ARG FTP_PASS

ENV FTP_USER=${FTP_USER}
ENV FTP_PASS=${FTP_PASS}
ENV DEBIAN_FRONTEND=noninteractive


RUN apt update && apt install -y -f vsftpd \
    && rm -rf /tmp/* /var/lib/apt/lists/*

RUN useradd ${FTP_USER} -d /var/www/html -M --password ${FTP_PASS} 

COPY ./tools/entrypoint.sh /entrypoint.sh
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x /entrypoint.sh

RUN echo ${FTP_USER} >> /etc/vsftpd.userlist
RUN service vsftpd start

EXPOSE 21

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "vsftpd" ]