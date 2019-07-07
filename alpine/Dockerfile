FROM alpine:latest
LABEL maintainer="Rémy Jacquin <remy@remyj.fr>"

COPY root/ /

RUN set -xe \
    && apk add --no-cache aria2 \
    && chmod +x /init.sh

# Create user and group and set ownership
RUN set -eux; \
	addgroup -g 82 -S aria2; \
	adduser -u 82 -D -S -G aria2 aria2; \
    mkdir /config /downloads \
    && chown -R aria2:aria2 /config \
    && chown -R aria2:aria2 /downloads

VOLUME /config /downloads

EXPOSE 6800

USER aria2

ENTRYPOINT ["/init.sh"]
