FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y vsftpd

COPY ./conf/vsftpd_conf.sh ./

COPY ./conf/vsftpd.conf ./etc/vsftpd.conf

RUN chmod 755 /vsftpd_conf.sh

ENTRYPOINT ["./vsftpd_conf.sh"]