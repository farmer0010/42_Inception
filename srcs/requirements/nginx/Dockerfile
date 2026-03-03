FROM alpine:3.22

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=KR/ST=Gyeongsangbuk-do/L=Gyeongsan/O=42Gyeongsan/OU=Innovation/CN=juyoukim.42.fr"

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]