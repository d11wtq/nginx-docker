FROM       d11wtq/ubuntu:14.04
MAINTAINER Chris Corbyn <chris@w3style.co.uk>

USER root

RUN apt-get -y update
RUN apt-get -y install libpcre3-dev

RUN cd /tmp; \
    curl -LO http://nginx.org/download/nginx-1.9.4.tar.gz; \
    tar xvzf nginx-*.tar.gz; \
    rm nginx-*.tar.gz; \
    cd nginx-*; \
    ./configure --prefix=/usr/local; \
    make && make install

ENV PROCESSES   16
ENV CONNECTIONS 1024
ENV PORT        8080
ENV INDEX       index.html
ENV SERVER_NAME localhost
ENV BACKEND     http://localhost:8080

ADD www /www

EXPOSE 8080

CMD [ "/www/start.sh" ]
