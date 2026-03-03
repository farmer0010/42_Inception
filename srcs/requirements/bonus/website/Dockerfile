FROM alpine:3.22

RUN apk update && apk upgrade && apk add --no-cache python3

WORKDIR /var/www

COPY conf/index.html .

EXPOSE 80

CMD ["python3", "-m", "http.server", "80"]