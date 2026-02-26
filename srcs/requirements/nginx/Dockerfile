FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/ssl/certs/inception.crt \
    -keyout /etc/ssl/private/inception.key \
    -subj "/C=KR/ST=Gyeongsangbuk-do/L=Gyeongsan/O=42Gyeongsan/OU=Innovation/CN=juyoukim.42.fr"

COPY conf/default.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
