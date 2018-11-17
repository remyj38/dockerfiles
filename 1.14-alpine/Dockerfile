FROM nginx:1.14-alpine

LABEL maintainer="Rémy JACQUIN <remy@remyj.fr>"

RUN apk add --no-cache openssl && \
    rm -rf /var/cache/apk/*

VOLUME ["/etc/nginx/ssl/"]

COPY generate-dh.sh /usr/local/bin/

ENTRYPOINT ["generate-dh.sh"]

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
