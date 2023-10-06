# Version: 1.0

FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx

COPY ./nibenoit.crt /etc/ssl/cert/


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]