# pull base image
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  vsftpd \
  vim

COPY ./conf/vsftpd_conf.sh ./

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x /vsftpd_conf.sh

ENTRYPOINT ["./vsftpd_conf.sh"]