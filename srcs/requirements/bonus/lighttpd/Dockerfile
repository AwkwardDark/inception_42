FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install lighttpd -y

COPY ./conf/index.html /var/www/html

RUN sed -i 's/server.port                 = 80/server.port                 = 4001/g' /etc/lighttpd/lighttpd.conf

CMD ["lighttpd", "-D" ,"-f" ,"/etc/lighttpd/lighttpd.conf"]