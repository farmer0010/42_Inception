FROM alpine:3.22

RUN apk update && apk upgrade && apk add --no-cache \
    php82 \
    php82-session \
    php82-mysqli \
    php82-iconv \
    php82-gd \
    php82-curl \
    php82-json \
    wget

WORKDIR /var/www

RUN wget https://www.adminer.org/latest.php -O index.php

EXPOSE 8080

CMD ["php82", "-S", "0.0.0.0:8080", "-t", "/var/www"]