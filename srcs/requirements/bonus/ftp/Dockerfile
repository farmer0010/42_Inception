FROM alpine:3.22

RUN apk update && apk upgrade && apk add --no-cache vsftpd

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY tools/setup_ftp.sh /usr/local/bin/setup_ftp.sh

RUN chmod +x /usr/local/bin/setup_ftp.sh

EXPOSE 21 21100-21110

CMD ["/usr/local/bin/setup_ftp.sh"]